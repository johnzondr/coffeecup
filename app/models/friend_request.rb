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

end
