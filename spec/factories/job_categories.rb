FactoryGirl.define do
  factory :job_category do
    name
    rank 0

    factory :job_category_with_jobs do
      ignore do
        job_count 5
      end

      after :create do |job_category, evaluator|
        FactoryGirl.create_list(:job, evaluator.job_count, job_category: job_category)
      end
    end
  end
end
