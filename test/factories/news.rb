FactoryGirl.define do
  factory :new, :class => 'New' do
    title { Faker::Lorem.word }
    text { Faker::Lorem.paragraph }
    date_publish { Faker::Time.between(5.days.from_now, DateTime.now) }
  end
end
