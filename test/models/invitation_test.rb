require 'test_helper'

class InvitationTest < ActiveSupport::TestCase

	test 'user can access their invites' do 
		invitation = FactoryGirl.create(:invitation)

		user = invitation.invitee
		
		# p user.inviters.last

	end
end
