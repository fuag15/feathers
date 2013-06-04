FactoryGirl.define do
  factory :post do
    title

    content do
      Forgery(:lorem_ipsum).words 10
    end

    picture do
      File.open Rails.root.join 'spec/support/pictures/waterdrop.jpg'
    end

    factory :post_with_pictures do
      ignore do
        picture_count 5
      end

      after :build do |post, evaluator|
        post.pictures << FactoryGirl.create_list(:picture, evaluator.picture_count)
      end
    end
  end
end
