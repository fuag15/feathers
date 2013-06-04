FactoryGirl.define do
  factory :picture do
    name

    image do
      File.open Rails.root.join 'spec/support/pictures/waterdrop.jpg'
    end

    factory :picture_with_post do
      after :create do |picture|
        post = FactoryGirl.create(:post)
        post.pictures << picture
      end
    end

    factory :picture_with_project do
      after :create do |picture|
        project = FactoryGirl.create(:project)
        project.pictures << picture
      end
    end

    factory :picture_with_job do
      after :create do |picture|
        job = FactoryGirl.create(:job)
        job.pictures << picture
      end
    end
  end
end