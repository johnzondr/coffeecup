class Checkin < ActiveRecord::Base
	belongs_to :user
	belongs_to :venue

	def self.refresh_checkouts
		old_checkins = Checkin.where('updated_at < ? AND checkout_time IS NULL', 5.minutes.ago)
		old_checkins.each do |checkin|
			checkin.checkout_time = Time.now
			checkin.save
		end
	end

	def self.clear_checkouts
		old_checkins = Checkin.all
		old_checkins.each do |checkin|
			checkin.checkout_time = nil
			checkin.save
		end
	end
end
