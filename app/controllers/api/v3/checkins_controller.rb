class Api::V3::CheckinsController < ApiController
	before_action :authenticate
	def create
		#find if user is already checked in
		#if user is checked in, update checkin
		#else create checkin
		checkin = Checkin.find_by(checkin_params, checkout_time: nil)

		if checkin
			checkin.updated_at = Time.now
			checkin.save

			render json: checkin
		else
			Checkin.create(checkin_params)
			render json: {
				message: 'user check in created'
			}
		end

	end

	def destroy
		#find checkin and sign user out
		checkin = Checkin.find_by(checkin_params, checkout_time: nil)
		
		if checkin	
			checkin.update(checkout_time: Time.now)
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
