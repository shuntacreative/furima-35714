FactoryBot.define do
  factory :user do
    nickname  {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    birthday { Faker::Date.backward }
    last_name_kanji { "山田" }
    first_name_kanji {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
  end
end