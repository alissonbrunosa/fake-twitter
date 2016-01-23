FactoryGirl.define do
  factory :post, class: Post do
    body "Test Fake twitter"
  end

  factory :two, class: Post do
    body "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. \
          Aenean commodo ligula eget dolor. Aenean massa. \
          Cum sociis natoque penatibus et magnis dis parturient"
  end
end
