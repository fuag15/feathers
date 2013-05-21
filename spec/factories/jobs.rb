FactoryGirl.define do
  factory :job do
    name
    employer
    rank 0
    asociation :job_category, factory: :job_category

    blurb do
      Forgery(:lorem_ipsum).words 10
    end

    detail do
      Forgery(:lorem_ipsum).words 20
    end

    factory :job_with_pictures do
      ignore do
        picture_count 5
      end

      after_build do |job, evaluator|
        job.pictures << create_list(:picture, evaluator.picture_count)
      end
    end
  end
end
