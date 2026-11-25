FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.unique.email }
    password              { '000aaa' }
    password_confirmation { password }
    first_name            { '太郎' }
    first_name_kana       { 'タロウ' }
    family_name           { '山田' }
    family_name_kana      { 'ヤマダ' }
    date_of_birth         { Faker::Date.birthday(min_age: 18, max_age: 60) }
  end
end
