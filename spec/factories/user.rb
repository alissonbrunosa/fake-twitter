FactoryGirl.define do
  factory :user, class: User do
    name "Fake user"
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "12345678"
    created_at "2016-01-25 13:39:36"
    updated_at "2016-01-25 14:24:46"
  end

  factory :follower, class: User do
    name "Fake user one"
    email "fakeuserone@email.com"
    password "12345678"
  end

  factory :user_two, class: User do
    name "Fake user one"
    email "fakeuserone@email.com"
    password "12345678"
    password_confirmation "12345678"
  end
end
