FactoryBot.define do
  factory :item do
    name               {"テスト商品"}
    explanation        {"商品出品機能の確認に設定された架空の商品です"}
    price              {"500"}
    category_id        {"2"}
    condition_id       {"2"}
    shipping_charge_id {"2"}
    shipping_from_id   {"2"}
    shipping_day_id    {"2"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jng')
    end
  end
end
