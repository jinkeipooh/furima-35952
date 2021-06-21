FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 2)}
    last_name             {'全角名前'}
    first_name            {'全角名字'}
    last_name_r           {'カナナマエ'}
    first_name_r          {'カナミョウジ'}
    birthday              {'19950808'}
  end
end