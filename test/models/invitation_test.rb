require 'test_helper'

class InvitationTest < ActiveSupport::TestCase

	test 'user can access their invites' do 
		invitation = FactoryGirl.create(:invitation)

		user = invitation.invitee
		p invitation.invitee.id
		p user.id

		p user.invitations.last

		



	end
end
