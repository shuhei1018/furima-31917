

FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    birthday {"2000/10/10"}
    last_name_kan  {"山田"}
    first_name_kan {"太郎"}
    last_name_kana  {"ヤマダ"}
    first_name_kana {"タロウ"}
  end
end
