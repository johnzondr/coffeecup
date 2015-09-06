FactoryGirl.define do  

  factory :friend_request do
    requesting_user
    requested_user
    
  end

  factory :user, aliases: [:friend, :inviter, :invitee, :requesting_user, :requested_user] do
    sequence (:first_name) do |n|
      "#{n}"
    end
  end

  factory :venue do
    name "Joes Brewery"
    city "champaign"
  end

  factory :friendship do
    user
    friend
  end

  factory :invitation do
    inviter
    invitee
  end

end
