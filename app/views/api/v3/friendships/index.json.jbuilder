json.friendships(@friendships) do |friendship|
	json.friendship_id friendship.id
	json.friend_id friendship.friend_id
	json.tag friendship.tag
end

json.friends(@friends) do |friend|
	json.user_id friend.id
	json.first_name friend.first_name
	json.last_name friend.last_name
end