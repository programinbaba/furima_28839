FactoryBot.define do
  factory :item do
    name          {"あイ右e5６"} # ひらがな、カタカナ、漢字、英字、数字、
    text          {"あイ右e5６"} # 全角、半角に対応しているかテスト
    category_id   {Faker::Number.between(from: 2, to: 11)}
    status_id     {Faker::Number.between(from: 2, to: 7)}
    cost_id       {Faker::Number.between(from: 2, to: 3)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    day_id        {Faker::Number.between(from: 2, to: 4)}
    price         {Faker::Number.between(from: 300, to: 9999999)}
    association :user
  end
end
