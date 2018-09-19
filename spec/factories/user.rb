FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    email {"admin@admin.com"}
    password {"123456"}
    age {20}
    sex {1}
  end
end