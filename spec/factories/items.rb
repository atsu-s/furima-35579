FactoryBot.define do
  factory :item do
    title              {"test"}
    text               {"test"}
    category_id        { 2 }
    status_id          { 2 }
    delivery_charge_id { 2 }
    prefecture_id      { 2 }
    period_id          { 2 }
    price              { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
