

FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    # birthday {}
    # last_name_kan  {}
    # first_name_kan {}
    # last_name_kana  {}
    # first_name_kana {}
  end
end
