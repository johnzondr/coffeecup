json.(@invitations) do |invitation|
	json.first_name invitation.inviter.first_name
	json.last_name invitation.inviter.last_name
	json.pic_sm invitation.inviter.pic_sm
	json.venue_name invitation.venue.name
	json.created_at invitation.created_at
end 