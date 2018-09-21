FactoryBot.define do
  factory :picture do
    url {FFaker::Avatar.image}
    user_id {1}
  end
end