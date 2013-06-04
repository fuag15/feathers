FactoryGirl.define do
  factory :package do
    version

    file do
      File.open Rails.root.join 'spec/support/packages/waterdrop.zip'
    end

    factory :package_with_project do
      after :create do |package|
        project = FactoryGirl.create(:project)
        project.packages << package
      end
    end
  end
end
