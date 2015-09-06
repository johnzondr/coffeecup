class OfferedReward < ActiveRecord::Base
	belongs_to :venue
	has_many :earned_rewards
end
