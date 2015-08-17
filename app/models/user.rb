class User < ActiveRecord::Base
	has_many :friendships
	has_many :friends, :through => :friendships


	has_many :invitee_invitations, class_name: 'Invitation', foreign_key: 'inviter_id'
	has_many :invitees, through: :invitee_invitations, source: :invitee
	
	has_many :inviter_invitations, class_name: 'Invitation', foreign_key: 'invitee_id'
	has_many :inviters, through: :inviter_invitations, source: :inviter
	

	has_many :earned_rewards
	has_many :checkins
	has_many :venues, :through => :checkins
end
