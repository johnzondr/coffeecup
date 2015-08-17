FactoryGirl.define do
  factory :user, aliases: [:friend, :inviter, :invitee] do
    sequence (:first_name) do |n|
      "#{n}"
    end
  end
end

FactoryGirl.define do
  factory :venue do
    name "Joes Brewery"
    city "champaign"
  end
end

FactoryGirl.define do
  factory :friendship do
    user
    friend
  end
end


FactoryGirl.define do
  factory :invitation do
    inviter
    invitee
  end
end