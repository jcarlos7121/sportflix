FactoryGirl.define do
  factory :card do
    cvv { '123' }
    expiration_date { '09/18' }
    card_number { Faker::Business.credit_card_number }
    user
  end
end
