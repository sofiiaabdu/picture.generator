Favourite.create!(
  url: 'http://placehold.it/300x150'
)

5.times do |i|
  User.create!(
      name: "#{i} user"
  )
end

5.times do
  Picture.create!(
    url: 'http://placehold.it/300x150',
    user_id: 1
  )
end


