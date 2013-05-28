FactoryGirl.define do
  factory :project do
    name
    team
    rank 0

    blurb do
      Forgery(:lorem_ipsum).words 10
    end

    detail do
      Forgery(:lorem_ipsum).words 20
    end

    factory :project_with_pictures_and_packages do
      ignore do
        picture_count 5
        package_count 5
      end

      after :build do |project, evaluator|
        project.pictures << FactoryGirl.create_list(:picture, evaluator.picture_count)
        project.packages << FactoryGirl.create_list(:package, evaluator.package_count)
      end
    end
  end
end
