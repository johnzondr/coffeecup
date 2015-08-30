class Api::V3::FriendshipsController < ApiController
	before_action :authenticate

	def index
		@friendships = @current_user.friendships
		@friends = @current_user.friends
		json = {:friendships => @friendships, :friends => @friends}
		render :json => json
	end

	def update
		@friendship = @current_user.friendships.find(params[:id])
		@friendship.tag = params[:tag]
		@friendship.save
	end

	private
	
	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			@current_user = User.find_by(token: token)
		end
	end

	
end
