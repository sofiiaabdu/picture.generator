class User < ApplicationRecord
  has_many :pictures
  has_one :address

  accepts_nested_attributes_for(:address, update_only: true, allow_destroy: true)
                                            #reject_if: lambda { |attrs| attrs['zip', 'city', 'street', 'house_member'].blank? }

  enum sex: { male: 0, female: 1, other: 2 }

  validates :first_name, length: { in: 1..100,
                                   too_long: "%{count} characters is the maximum allowed"}
  validates :last_name, length: { in: 1..100,
                                  too_long: "%{count} characters is the maximum allowed"}
  validates :about, length: { maximum: 300,
                              too_long: "%{count} characters is the maximum allowed"}
  validates :age, numericality: { only_integer: true, greater_than: 0, less_than: 120,
                                  message: "%{value} seems wrong, it must be less than 120" }

end
