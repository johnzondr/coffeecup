class Invitation < ActiveRecord::Base
	belongs_to :inviter, :class_name => "User"
	belongs_to :invitee, :class_name => "User"
	belongs_to :venue
	after_create :send_invitations

	def accept
		notify = IosPushNotification.new
		message = invitee.first_name.to_s + " " + invitee.last_name.to_s + " is coming to " + venue.name.to_s + "."
		notify.send(inviter, message)
		self.destroy
	end
	
	private

	

	def send_invitations
		notify = IosPushNotification.new
		venue = Venue.find(self.venue_id)
		message = inviter.first_name.to_s + " " +inviter.last_name.to_s + " invited you to " + venue.name.to_s + "."
		notify.send(self.invitee, message)
	end
end
