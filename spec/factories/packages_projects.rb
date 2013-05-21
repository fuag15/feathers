FactoryGirl.define do
  factory :packages_project do
    association :package, factory: :package
    association :project, factory: :project
  end
end
