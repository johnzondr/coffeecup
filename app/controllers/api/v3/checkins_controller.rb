class Api::V3::CheckinsController < ApiController
	before_action :authenticate
	def create
		#find if user is already checked in
		#if user is checked in, update checkin
		#else create checkin
		checkin = Checkin.where(checkin_params, checkout_time: nil)
		
		if checkin
			checkin.updated_at = Time.now
			checkin.save	
			render json: {
				message: 'user check in updated'
			}
		else
			Checkin.create(checkin_params)
			render json: {
				message: 'user check in created'
			}
		end

	end

	def destroy
		#find checkin and sign user out
		checkin = Checkin.where(checkin_params, checkout_time: nil)
		
		if checkin	
			checkin.checkout_time = Time.now
			checkin.save
			render json: {
				message: 'user checked out'
			}
		else
			render json: {
				message: 'user check in failed'
			}
		end

	end



	private

	def authenticate
		authenticate_or_request_with_http_token do |token, options|
			@current_user = User.find_by(token: token)
		end
	end

	def checkin_params
		{
			user_id: @current_user.id,
			venue_id: params[:venue_id]
		}
	end
end
