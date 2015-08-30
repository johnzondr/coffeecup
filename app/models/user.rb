class User < ActiveRecord::Base
	before_create :generate_access_token
	after_create :set_defaults
	

	#friendships
	has_many :friendships
	has_many :friends, :through => :friendships

	#friend requests
	has_many :requesting_user_requests, class_name: 'FriendRequest', foreign_key: 'requesting_user_id'
	has_many :sent_requests, through: :requesting_user_requests, source: :requested_user

	has_many :requested_user_requests, class_name: 'FriendRequest', foreign_key: 'requested_user_id'
	has_many :received_requests, through: :requested_user_requests, source: :requesting_user



	# invitations
	has_many :invitee_invitations, class_name: 'Invitation', foreign_key: 'inviter_id'
	has_many :invitees, through: :invitee_invitations, source: :invitee
	
	has_many :inviter_invitations, class_name: 'Invitation', foreign_key: 'invitee_id'
	has_many :inviters, through: :inviter_invitations, source: :inviter
	

	has_many :earned_rewards
	has_many :checkins
	has_many :venues, :through => :checkins

	private

	def set_defaults
		self.hidden = false
	end

	def get_info_from_facebook
		#
	end
	def generate_access_token
	    begin
	      self.token = SecureRandom.hex
	    end while self.class.exists?(token: token)
 	end
end
