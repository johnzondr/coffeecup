class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User"

	def as_json(options = {})
		friend = User.find(self.friend_id)
		json_data = super(options)
		json_data.merge(:first_name=> friend.first_name, :last_name => friend.last_name, :pic_sm => friend.pic_sm)
	end
end
