class Api::V3::UsersController < ApplicationController

	before_action :authenticate, :only => [:index, :update]

	def index
		@current_user
	end

	private

	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			@current_user = User.find_by(token: token)
		end
	end
end
