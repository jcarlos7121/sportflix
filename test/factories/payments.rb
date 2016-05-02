FactoryGirl.define do
  factory :payment do
    month_reference { Faker::Time.between(5.days.from_now, DateTime.now) }
    payment_date { Faker::Time.between(5.days.from_now, DateTime.now) }
    payment_type { 1 }
    cost { 9.99 }
  end
end
