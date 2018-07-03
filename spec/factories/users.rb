FactoryBot.define do
  factory :user do
    name Faker::Name.name
    nickname Faker::Name.name
    uid Faker::IDNumber.invalid
    token Faker::IDNumber.invalid
    avatar_url Faker::Avatar.image
    follower_count Faker::Number.number(3)
    following_count Faker::Number.number(3)
  end
end
