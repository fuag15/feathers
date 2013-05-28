FactoryGirl.define do
  factory :project_category do
    name
    rank 0

    factory :project_category_with_projects do
      ignore do
        project_count 5
      end

      after :create do |project_category, evaluator|
        FactoryGirl.create_list(:project, evaluator.project_count, project_category: project_category)
      end
    end
  end
end
