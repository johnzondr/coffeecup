class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User"

	def as_json(options = {})
		json_data = super(options)
		json_data.merge(:hi => "hello")
	end
end
