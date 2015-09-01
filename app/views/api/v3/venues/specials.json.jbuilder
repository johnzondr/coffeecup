json.(@venues) do |venue|
	json.drinks_header "Drink Specials"
	json.drinks_content venue.drinks
	json.food_header ""
	json.food_content ""
	json.id venue.id
	json.name venue.name
	json.other_header "Other Specials"
	json.other_content venue.food
end

