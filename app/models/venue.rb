class Venue < ActiveRecord::Base
	has_many :checkins
	has_many :users, :through => :checkins
	has_many :offered_rewards
	has_many :ibeacons
	has_many :venue_infos
	has_many :invitations

	def friends_here_for(user_id)
		checkins = self.checkins.where(checkout_time: nil)
		friends_here = []
		checkins.each do |checkin|
			checked_in_user = checkin.user
			if checked_in_user && checked_in_user.is_friends_with?(user_id)
				friends_here << checked_in_user
			end
		end
		friends_here
	end

	def update_specials
		day_int = Time.zone.today.wday
		specials = self.venue_infos.where(day: day_int).last
		if specials
			self.drinks = specials.drinks
			self.food = specials.food
			self.save
		else
			self.drinks = ""
			self.food = ""
			self.save
		end
	end
end
