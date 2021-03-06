FactoryBot.define do
  factory :purchase_address do
    postalcode { '123-4567' }
    prefecture_id { 2 }
    municipality  { Faker::Address.city }
    house_number  { Faker::Address.street_address }
    building_name { Faker::Address.street_name }
    phonenumber { Faker::Number.number(digits: 11) }
    token { 'tok_7a9cf1b9c6900fe4a4a64060135e' }
  end
end
