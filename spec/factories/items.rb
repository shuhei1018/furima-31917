FactoryBot.define do
  factory :item do
    name {Faker::Lorem.word}
    explanation {Faker::Lorem.sentence}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
  end
end
