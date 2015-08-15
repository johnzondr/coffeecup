class EarnedReward < ActiveRecord::Base
	belongs_to :user
	belongs_to :offered_reward
end
