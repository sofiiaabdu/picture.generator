require 'securerandom'

Favourite.create!(
  url: 'http://placehold.it/300x150'
)

30.times do
  User.create!(
       first_name: Faker::Name.first_name,
       last_name: Faker::Name.last_name,
       age: rand(0..120),
       sex: rand(0..2),
       about: SecureRandom.hex
  )
end

2.times do
  Picture.create!(
    url: 'http://placehold.it/300x150',
    user_id: 1
  )
end


