class Api::V3::UsersController < ApiController

	before_action :authenticate, :only => [:index, :update, :status, :fbtoken, :hide, :unhide]

	def index
		@current_user
	end

	def create
		#facebook id check if current user already exists
		@graph = Koala::Facebook::API.new(params[:fb_token])
		@profile = @graph.get_object("me")
		facebook_id = @profile["id"]

		#see if user's facebook id already exists in database
		@user = User.find_by(fb_id: facebook_id)

		#if user's facebook id is already in database, update info
		if @user
			@user.update(user_params)
			@user.save
		end
	
		#if user doesn't already exist, create user
		if ! @user 
			@user = User.create(user_params)
		end


	end

	def status
		@current_user.status = params[:status]
		@current_user.save
	end

	def fbtoken
		@current_user.fb_token = params[:fb_token]
		@current_user.save
		render json: {}, status: 200
	end

	def hide
		@current_user.hidden = 1
		@current_user.save

		render json: @current_user, status: 200
	end

	def unhide
		@current_user.hidden = 0
		@current_user.save

		render json:{}, status: 200
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
			version: params[:version],
			first_name: @profile["first_name"],
			last_name: @profile["last_name"],
			fb_id: @profile["id"],
			gender: @profile["gender"]
		}
	end
end
