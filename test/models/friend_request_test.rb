require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'user can access friendrequests' do
  	friendrequest = FactoryGirl.create(:friend_request)

  	user = friendrequest.requested_user

  	p user.received_requests.last
  end
end
