require 'securerandom'

Favourite.create!(
  url: 'http://placehold.it/300x150'
)

30.times do
  user = User.create!(
       first_name: Faker::Name.first_name,
       last_name: Faker::Name.last_name,
       age: rand(1..120),
       sex: rand(0..2),
       about: SecureRandom.hex,
      )
  Address.create!(
      zip: Faker::Number.number(5),
      city: Faker::Address.city,
      street: Faker::Address.street_name,
      house_member: rand(0..5000),
      user_id: user.id
      )
end


2.times do
  Picture.create!(
    url: 'http://placehold.it/300x150',
    user_id: 1
  )
end


