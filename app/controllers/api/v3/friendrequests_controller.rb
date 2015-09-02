class Api::V3::FriendrequestsController < ApiController
	before_action :authenticate

	def index
		@requests = @current_user.requested_user_requests
		
		render :json =>  @requests
	end

	def create
		requested_friend = User.find_by(fb_id: params[:fb_id])
		friend_request = FriendRequest.new
		friend_request.requesting_user_id = @current_user.id
		friend_request.requested_user_id = requested_friend.id
		friend_request.save

		if friend_request.save
			render json: friend_request
		else
			render json: {
				message: 'validation failed'
			}
		end
	end

	def update
		friend_request = FriendRequest.find(params[:id])
		succeeded = friend_request.accept
		if succeeded
			render json: succeeded
		else
			# render failure json
		end
	end

	def destroy
		friend_request = FriendRequest.find(params[:id])
		succeeded = friend_request.destroy
		if succeeded 
			# render json
		else
			# render json
		end
	end

	private

	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			@current_user = User.find_by(token: token)
		end
	end

	def friend_request_params
		{
			fb_id: params[:fb_id],
		}
	end
end
