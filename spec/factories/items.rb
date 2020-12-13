FactoryBot.define do
  factory :item do
    name {Faker::Lorem.word}
    explanation {Faker::Lorem.sentence}
    category_id  {2}
    status_id  {2}
    delivery_burden_id  {2}
    delivery_area_id  {2}
    delivery_date_id  {2}
    price  {1000}
    user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
