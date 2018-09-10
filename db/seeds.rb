require 'securerandom'


100.times do
  user = User.create!(
       email: Faker::Internet.email,
       password: '111111',
       first_name: Faker::Name.first_name,
       last_name: Faker::Name.last_name,
       age: rand(1..119),
       sex: rand(0..2),
       about: SecureRandom.hex,
       admin: false
      )
  Address.create!(
      zip: Faker::Number.number(5),
      city: Faker::Address.city,
      street: Faker::Address.street_name,
      house_member: rand(0..4999),
      user_id: user.id,
      )
end


2.times do
  Picture.create!(
    url: 'http://placehold.it/300x150',
    user_id: 1
  )
end

Favourite.create!(
    picture_id: 1,
    user_id: 1
)


user = User.create!(
    id: 101,
    email: Faker::Internet.email,
    password: '111111',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(1..119),
    sex: rand(0..2),
    about: SecureRandom.hex,
    admin: true
)
Address.create!(
    zip: Faker::Number.number(5),
    city: Faker::Address.city,
    street: Faker::Address.street_name,
    house_member: rand(0..4999),
    user_id: user.id,
    )