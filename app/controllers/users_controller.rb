class UsersController < ApplicationController

	def index
		@users = User.all
		respond_to do |format|
			format.json {render json: @current_user}
			format.html
		end
	end

	private

	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			@current_user = User.find_by(token: token)
		end
	end


end
