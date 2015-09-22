json.(@venues) do |venue|
	json.drinks_header "Drink Specials"
	if venue.drinks
		json.drinks_content venue.drinks
	else
		json.drinks_content ""
	end
	json.food_header ""
	json.food_content ""
	json.id venue.id
	json.name venue.name
	json.other_header "Other Specials"
	if venue.food
		json.other_content venue.food
	else
		json.other_content ""
	end
end

