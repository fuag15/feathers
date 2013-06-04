FactoryGirl.define do
  factory :resume_category do
    name
    rank 0

    factory :resume_category_with_resume_entries do
      ignore do
        resume_entry_count 5
      end

      after :create do |resume_category, evaluator|
        FactoryGirl.create_list(:resume_entry, evaluator.resume_entry_count, resume_category: resume_category)
      end
    end
  end
end
