class Venue < ActiveRecord::Base
	has_many :checkins
	has_many :users, :through => :checkins
	has_many :offered_rewards
	has_many :ibeacons
	has_many :venue_infos
end
