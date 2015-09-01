class Invitation < ActiveRecord::Base
	belongs_to :inviter, :class_name => "User"
	belongs_to :invitee, :class_name => "User"
	belongs_to :venue

	def accept
		#send notifcation to inviter that invitee accepted invite
	end
end
