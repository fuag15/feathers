FactoryGirl.define do
  factory :image do
    name
    
    file do
      File.open Rails.root.join 'spec/support/images/waterdrop.jpg'
    end

    factory :image_with_article do
      association :article, factory: :article
    end

    factory :image_with_project do
      association :project, factory: :project
    end
  end
end