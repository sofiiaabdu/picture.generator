class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :zip,  numericality: { only_integer: true },
                    length: { is: 5,
                              too_long: "Zip must contain 5 digits"}

  validates :city, length: { in: 1..100,
                                  too_long: "Too long name"}

  validates :street, length: { in: 1..100,
                             too_long: "Too long name"}

  validates :house_member, numericality: { greater_than: 0, less_than: 5000,
                             too_long: "Too big number"}

  scope :city, -> (name) { where city: name }
end

