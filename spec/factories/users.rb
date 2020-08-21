FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { 'hankaku123' } # Fakerでpasswordを生成すると、
    password_confirmation { password }     # 大文字まで含まれてしまうため、あらかじめこちらで指定
    family_name           { 'やマ田' }      # ユーザー本名は全角でひらがな、カタカナ、漢字を
    first_name            { '太ろウ' }      # 許容するのであらかじめこちらで指定
    family_name_katakana  { 'ヤマダ' }
    first_name_katakana   { 'タロウ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
