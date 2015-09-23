task :refresh_checkouts => :environment do
	Checkin.refresh_checkouts
	puts "checking old users out"
end

task :update_all_venue_specials => :environment do
	venues = Venue.all 
	venues.each do |venue|
		venue.update_specials
	end
end