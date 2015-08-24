class Api::V3::InvitationsController < ApiController

	before_action :authenticate

	def index
		@invitations = Invitation.all

	end


	private

	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			@current_user = User.find_by(token: token)
		end
	end

end
