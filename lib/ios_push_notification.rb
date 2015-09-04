class IosPushNotification
	attr_accessor :pusher
	def initialize
		self.pusher = Grocer.pusher(
		  certificate: "#{Rails.root}/lib/cert.pem",      # required
		  passphrase:  "zondr",                       # optional
		  gateway:     "gateway.sandbox.push.apple.com", # optional; See note below.
		  port:        2195,                     # optional
		  retries:     3                         # optional
		)
	end

	def send
		notification = Grocer::Notification.new(
		  device_token:      "a8dd36a2743275c32098eda648f987a88aab81c6ebb4e72777a58ec5bdcd55db",
		  alert:             "I am the best!",
		  badge:             42,
		  category:          "a category",         # optional; used for custom notification actions
		  sound:             "siren.aiff",         # optional
		  expiry:            Time.now + 60*60,     # optional; 0 is default, meaning the message is not stored
		  identifier:        1234,                 # optional; must be an integer
		  content_available: true                  # optional; any truthy value will set 'content-available' to 1
		)
		pusher.push(notification)
	end
end