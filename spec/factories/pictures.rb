FactoryGirl.define do
  factory :picture do
    name

    image do
      File.open Rails.root.join 'spec/support/pictures/waterdrop.jpg'
    end

    factory :picture_with_post do
      after_create do |picture|
        post = create(:post)
        post.pictures << picture
      end
    end

    factory :picture_with_project do
      after_create do |picture|
        project = create(:project)
        project.pictures << picture
      end
    end

    factory :picture_with_job do
      after_create do |picture|
        job = create(:job)
        job.pictures << picture
      end
    end
  end
end