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

	def is_friends_with?(user_id)
		friendship = self.friendships.find_by(friend_id: user_id)
		if friendship and (friendship.tag == "friend" or friendship.tag == "best friend")
			return true
		end
	end

	def notify_friends(friends)
		#if user just joined zondr 3.0
		unless installed_already == true
			self.update_attributes(installed_already: true)
			notification_list = []
			friends.each do |friend|
				user_friend = User.find_by(fb_id: friend["id"])
				if user_friend
					notification_list << user_friend
				end
			end

			notify = IosPushNotification.new
			message = first_name.to_s + " " + last_name.to_s + " has joined the new Zondr!"
			notify.send(notification_list, message)
			
		end
	end

	private

	def set_defaults
		self.hidden = false
		if self.fb_id
			self.pic_sm = "http://graph.facebook.com/#{self.fb_id}/picture"
			self.save
		end
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
