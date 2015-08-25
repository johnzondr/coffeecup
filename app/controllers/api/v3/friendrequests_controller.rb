class Api::V3::FriendrequestsController < ApiController
	before_action :authenticate

	def index
		@requests = @current_user.received_requests
	end

	def create
		@current_user
		@friend_request = FriendRequest.new(friend_request_params)
		if @friend_request.save
			render json: @friend_request
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
			render plain: "ok"
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
		params.require(:friendrequest).permit(:requested_user_id).merge(requesting_user_id: @current_user.id)
	end
end
