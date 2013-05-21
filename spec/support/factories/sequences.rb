FactoryGirl.define do
  sequence :name do |n|
    "name#{n}"
  end

  sequence :title do |n|
    "title#{n}"
  end

  sequence :version do |n|
    "version#{n}"
  end

  sequence :employer do |n|
    "employer#{n}"
  end

  sequence :team do |n|
    "team#{n}"
  end

  secuence :street do |n|
    "street#{n}"
  end

  secuence :city do |n|
    "city#{n}"
  end

  sequence :email do |n|
    "test#{n}@test.com"
  end
end