FactoryGirl.define do
  sequence :name do |n|
    "article#{n}"
  end

  sequence :email do |n|
    "test#{n}@test.com"
  end
end