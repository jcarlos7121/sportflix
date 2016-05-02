FactoryGirl.define do
  factory :admin_user do
    email { Faker::Internet.email }
    password { Faker::Internet.email }
  end
end
