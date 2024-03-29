class Api::V3::VenuesController < ApiController
	before_action :authenticate

	def index
		@venues = Venue.all
	end

	def version
		
	end

	def friends
		@venues = Venue.all
		@current_user
	end

	def specials
		@venues = Venue.all
	end


	private

	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			@current_user = User.find_by(token: token)
		end
	end


end
