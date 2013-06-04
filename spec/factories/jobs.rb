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
  end
end
