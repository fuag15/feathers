FactoryGirl.define do
  factory :jobs_picture do
    association :job, factory: :job
    association :picture, factory: :picture
  end
end
