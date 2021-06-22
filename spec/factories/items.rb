FactoryBot.define do
  factory :item do
    name          {'プーさん'}
    text          {'ぬいぐるみですよ'}
    category_id   {'3'}
    condition_id  {'4'}
    charge_id     {'4'}
    prefecture_id {'3'}
    day_id        {'2'}
    price         {'5000'}
    user_id       {'1'}
  end
end
