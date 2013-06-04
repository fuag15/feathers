FactoryGirl.define do
  factory :pictures_project do
    association :picture, factory: :picture
    association :project, factory: :project
  end
end
