class FriendRequest < ActiveRecord::Base
	belongs_to :requesting_user, :class_name => "User"
	belongs_to :requested_user, :class_name => "User"
	after_create :send_friend_request_notification

	def accept
		#ActiveRecord.transaction do
			Friendship.create do |friendship|
				friendship.user_id = self.requesting_user_id
				friendship.friend_id = self.requested_user_id
				friendship.tag = "friend"
			end
			Friendship.create do |friendship|
				friendship.user_id = self.requested_user_id
				friendship.friend_id = self.requesting_user_id
				friendship.tag = "friend"
			end
			self.destroy
		#end

		notify = IosPushNotification.new
		message = requested_user.first_name.to_s + " " + requested_user.last_name.to_s + " has accepted your friend request!"
		notify.send(requesting_user, message)
	end

	def as_json(options = {})
		friend = User.find(self.requesting_user_id)
		json_data = super(options)
		json_data.merge(:first_name=> friend.first_name, :last_name => friend.last_name, :pic_sm => friend.pic_sm)
	end

	private

	def send_friend_request_notification
		notify = IosPushNotification.new
		if requested_user.first_name #if the requested user has a firstname (aka they exist)
			message = requesting_user.first_name.to_s + " " +requesting_user.last_name.to_s + " sent you a friend request."
			notify.send(requested_user, message)
		end
	end

end
