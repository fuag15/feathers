FactoryGirl.define do
  factory :resume_entry do
    name
    rank 0
    association :resume_category, factory: :resume_category
  end
end
