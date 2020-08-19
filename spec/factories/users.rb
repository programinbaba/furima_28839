FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {"hankaku123"}
    password_confirmation {password}
    family_name           {"やマ田"}
    first_name            {"太ろウ"}
    family_name_katakana  {"ヤマダ"}
    first_name_katakana   {"タロウ"}
    birthday              {"1930-01-01"}
  end
end