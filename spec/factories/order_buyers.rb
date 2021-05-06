FactoryBot.define do
  factory :order_buyer do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city_name     {'青山'}
    address       {'青山1-1-1'}
    building_name {'青山ビル'}
    tell_number   {'00000000000'}
  end
end