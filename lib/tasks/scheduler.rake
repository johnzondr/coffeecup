task :refresh_checkouts => :environment do
	Checkin.refresh_checkouts
	puts "checking old users out"
end