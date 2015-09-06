class FriendRequest < ActiveRecord::Base
	belongs_to :requesting_user, :class_name => "User"
	belongs_to :requested_user, :class_name => "User"

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
	end

	def as_json(options = {})
		friend = User.find(self.requesting_user_id)
		json_data = super(options)
		json_data.merge(:first_name=> friend.first_name, :last_name => friend.last_name, :pic_sm => friend.pic_sm)
	end

end
