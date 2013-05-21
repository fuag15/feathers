FactoryGirl.define do
  factory :resume_category do
    name
    rank 0

    factory :resume_category_with_resume_entry do
      ignore do
        resume_entry_count 5
      end

      after_create do |resume_category, evaluator|
        create_list(:resume_entry, evaluator.resume_entry_count, resume_category: resume_category)
      end
    end
  end
end
