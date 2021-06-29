FactoryBot.define do
  factory :order_address do
    post_code {'123-4567'}
    prefecture_id {2}
    city {'横浜市西区'}
    house_num {'12-8'}
    building {'ランドマークタワー'}
    phone_num {'0120681147'}
  end
end