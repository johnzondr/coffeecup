class User < ActiveRecord::Base
	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :invitations
	has_many :inviter, :through => :invitations, :foreign_key => "Invitee"
	has_many :invitee, :through => :invitations, :foreign_key => "Inviter"
	has_many :earned_rewards
	has_many :checkins
	has_many :venues, :through => :checkins
end
