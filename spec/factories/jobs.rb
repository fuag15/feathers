FactoryGirl.define do
  factory :job do
    name
    employer
    rank 0
    association :job_category, factory: :job_category

    blurb do
      Forgery(:lorem_ipsum).words 10
    end

    detail do
      Forgery(:lorem_ipsum).words 20
    end

    factory :job_with_pictures_and_packages do
      ignore do
        picture_count 5
        package_count 5
      end

      after :build do |job, evaluator|
        job.pictures << FactoryGirl.create_list(:picture, evaluator.picture_count)
        job.packages << FactoryGirl.create_list(:package, evaluator.package_count)
      end
    end
  end
end
