FactoryGirl.define do
  factory :package do
    version

    file do
      File.open Rails.root.join 'spec/support/packages/waterdrop.zip'
    end

    factory :package_with_project do
      after_create do |package|
        project = create(:project)
        project.packages << package
      end
    end
  end
end
