class IosPushNotification
	attr_accessor :pusher
	def initialize
		self.pusher = Grocer.pusher(
		  certificate: "#{Rails.root}/lib/prod.pem",      # required
		  passphrase:  "zondr",                       # optional
		  gateway:     "gateway.push.apple.com", # optional; See note below.
		  port:        2195,                     # optional
		  retries:     3                         # optional
		)
	end

	# type 0 general message
	# type 1 friends
	# type 2 invites

	def send(users, message)
		user_ary = []
		user_ary << users
		user_ary.flatten!
		notifications = user_ary.map do |user|
			Grocer::Notification.new(
			  device_token:      user.device_token,
			  alert:             message,
			  badge:             1,
			  category:          "a category",         # optional; used for custom notification actions
			  sound:             "siren.aiff",         # optional
			  expiry:            Time.now + 60*60,     # optional; 0 is default, meaning the message is not stored
			  identifier:        1234,                 # optional; must be an integer
			  content_available: true,                  # optional; any truthy value will set 'content-available' to 

			)
		end

		notification_ary = []
		notification_ary << notifications
		notification_ary.flatten!

		notification_ary.each do |notif|
			pusher.push(notif)
		end
	end

end


