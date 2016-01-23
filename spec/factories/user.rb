FactoryGirl.define do
  factory :user, class: User do
    name "Fake user"
    email "fake@email.com"
    password "abc12345"
  end

  factory :follower, class: User do
    name "Fake user one"
    email "fakeuserone@email.com"
    password "abc12345"
  end
end
