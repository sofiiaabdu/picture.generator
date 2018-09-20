FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    password {"123456"}
    age {20}
    sex {1}
    sequence (:email) {|step| "ed#{step}@example.com"}
    address
  end
end