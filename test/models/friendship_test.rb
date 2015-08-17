require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'user can access friends through friendships' do

  	friendship = FactoryGirl.create(:friendship)
  	user = friendship.user

  	friendship2 = FactoryGirl.create(:friendship, user: user)


  	assert_same(user, friendship2.user)
  end
end
