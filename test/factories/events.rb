FactoryGirl.define do
  factory :event do
    name        { Faker::Lorem.word }
    event_type        { 1 }
    event_time  { Faker::Time.between(5.days.from_now, DateTime.now) }
    url_service { Faker::Internet.url }
  end
end
