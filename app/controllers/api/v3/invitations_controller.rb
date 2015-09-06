class Api::V3::InvitationsController < ApiController

	before_action :authenticate

	def index
		@invitations = @current_user.inviter_invitations.includes([:venue, :inviter]).all
	end

	def create
		invitation = Invitation.new
		invitation.inviter = @current_user
		invitation.invitee_id = params[:invited_user]
		invitation.venue_id = params[:venue_id]
		invitation.save
		render json: invitation, status: 200
	end

	def destroy
		invitation = Invitation.find(params[:id])
		response = params[:response]
		if invitation.invitee == @current_user
			if response == "accept"
				invitation.accept
				render json: {response: "accepted invitation"}

			elsif response == "reject"
				# invitation.destroy
				invitation.destroy
				render json: {response: "rejected invitation"}

			end
		else
			render json: {error: "invitation doesn't belong to user"}
		end

	end


	private

	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			@current_user = User.find_by(token: token)
		end
	end

end
