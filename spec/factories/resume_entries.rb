# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resume_entry do
    name "MyString"
    rank 1
    resume_category nil
  end
end
