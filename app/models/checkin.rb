require 'houston'

class Checkin < ActiveRecord::Base
	belongs_to :user
	belongs_to :venue

	def self.refresh_checkouts
		old_checkins = Checkin.where('updated_at < ? AND checkout_time IS NULL', 5.minutes.ago)
		old_checkins.each do |checkin|
			checkin.checkout_time = Time.now
			checkin.save
		end
	end

	def self.clear_checkouts
		old_checkins = Checkin.all
		old_checkins.each do |checkin|
			checkin.checkout_time = nil
			checkin.save
		end
	end
	# def self.send
	#     pusher = Grocer.pusher(
	#       certificate: Rails.root.join("lib", "cert.pem").to_s,
	#       #certificate: "#{path}/lib/cert.pem",     # required
	#       passphrase:  "zondr",                       # optional
	#       gateway:     "gateway.push.apple.com", # optional; See note below.
	#       port:        2195,                     # optional
	#       retries:     3                         # optional
	#     )

	#     notification = Grocer::Notification.new(
	#       device_token:      "5582aa602520add99ce6714414a6a5ea89d700e1e71a2406aff993bc22f65a59",
	#       alert:             "James did this work?",
	#       badge:             2,
	#       category:          "a category",         # optional; used for custom notification actions
	#       sound:             "siren.aiff",         # optional
	#       expiry:            Time.now + 60*60,     # optional; 0 is default, meaning the message is not stored
	#       identifier:        1234,                 # optional; must be an integer
	#       content_available: true                  # optional; any truthy value will set 'content-available' to 1
	#     )

	#     pusher.push(notification) # return value is the number of bytes sent successfully


	#     # pusher = Grocer.pusher(connection_opions)
	#     # notifications.each do |notification|
	#     #   pusher.push(notification)t
	#     # end
	# end 

	def self.send


		# Environment variables are automatically read, or can be overridden by any specified options. You can also
		# conveniently use `Houston::Client.development` or `Houston::Client.production`.
		APN = Houston::Client.development
		APN.certificate = File.read(Rails.root.join("lib", "cert.pem").to_s)

		# An example of the token sent back when a device registers for notifications
		token = "<5582aa602520add99ce6714414a6a5ea89d700e1e71a2406aff993bc22f65a59>"

		# Create a notification that alerts a message to the user, plays a sound, and sets the badge on the app
		notification = Houston::Notification.new(device: token)
		notification.alert = "Hello, World!"

		# Notifications can also change the badge count, have a custom sound, have a category identifier, indicate available Newsstand content, or pass along arbitrary data.
		notification.badge = 2
		notification.sound = "sosumi.aiff"
		#notification.category = "INVITE_CATEGORY"
		#notification.content_available = true
		#notification.custom_data = {foo: "bar"}

		# And... sent! That's all it takes.
		APN.push(notification)
	end
end
