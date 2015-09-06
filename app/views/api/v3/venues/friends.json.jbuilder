json.(@venues) do |venue|
	json.venue_id venue.id
	json.friends venue.friends_here_for(@current_user.id)
end