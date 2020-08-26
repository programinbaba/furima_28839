FactoryBot.define do
  factory :user_dealing do
    token         { 'token_test' }
    postal_code   { '111-1111' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Gimei.address.city.kanji }
    house_num     { Gimei.address.city.to_s }
    building      { Gimei.address.town.kanji }
    # 先頭が0で11桁の数字
    phone         { Faker::Number.leading_zero_number(digits: 11) }
  end
end
