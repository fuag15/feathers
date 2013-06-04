FactoryGirl.define do
  factory :pictures_post do
    association :post, factory: :post
    association :picture, factory: :picture
  end
end
