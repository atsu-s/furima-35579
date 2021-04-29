FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 4)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name_kanji     {'佐藤'}
    first_name_kanji      {'太朗'}
    family_name           {'サトウ'}
    first_name            {'タロウ'}
    birth_day             {'2000-05-10'}
  end
end