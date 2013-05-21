FactoryGirl.define do
  factory :user do
    email
    password 'testpassword'

    factory :admin_user do
      role 'admin'
    end
  end
end
