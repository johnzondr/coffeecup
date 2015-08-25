class Api::V3::UsersController < ApiController

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
		{

			device_id: params[:device_id],
			device_token: params[:device_token],
			device_os: params[:device_os],
			fb_token: params[:fb_token],
			version: params[:verion],

		}
	end
end
