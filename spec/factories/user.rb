FactoryGirl.define do
  factory :user, class: User do
    name "Fake user"
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "12345678"
  end

  factory :follower, class: User do
    name "Fake user one"
    email "fakeuserone@email.com"
    password "12345678"
  end
end
