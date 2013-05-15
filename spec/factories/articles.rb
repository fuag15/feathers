FactoryGirl.define do
  factory :article do
    name
    content do
      Forgery(:lorem_ipsum).words 10
    end
  end
end
