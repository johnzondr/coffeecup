json.(@venues) do |venue|
	json.venue_name venue.name
	json.friends venue.friends_here_for(@current_user.id)
end