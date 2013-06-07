FactoryGirl.define do
  factory :jobs_package do
    association :job, factory: :job
    association :package, factory: :package
  end
end
