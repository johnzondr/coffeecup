class Api::V3::UsersController < ApplicationController

	before_action :authenticate, :only => [:index, :update]

	def index
		@current_user
	end

	def create
		@user = User.create(user_params)
	end

	def status
		@current_user.status = params[:status]
	end

	private

	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			@current_user = User.find_by(token: token)
		end
	end

	def user_params
		params.require(:user).permit()
	end
end
