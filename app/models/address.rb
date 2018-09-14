class Address < ApplicationRecord
  belongs_to :user

  validates :zip, length: { is: 5,
                                   too_long: "Zip must contain 5 cyphers"}

  validates :city, length: { in: 1..100,
                                  too_long: "Too long name"}

  validates :street, length: { in: 1..100,
                             too_long: "Too long name"}

  validates :house_member, numericality: { less_than: 5000,
                             too_long: "Too big number"}

  scope :city, -> (name) { where city: name }
end

