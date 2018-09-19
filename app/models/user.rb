class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pictures, dependent: :destroy
  has_one :address
  has_many :favourites, dependent: :destroy

  accepts_nested_attributes_for(:address, update_only: true, allow_destroy: true)

  enum sex: { male: 0, female: 1, other: 2 }

  validates :first_name, length: { in: 1..100,
                                   too_long: "%{count} characters is the maximum allowed"}
  validates :last_name, length: { in: 1..100,
                                  too_long: "%{count} characters is the maximum allowed"}

  validates :about, length: { maximum: 300,
                              too_long: "%{count} characters is the maximum allowed"}

  validates :age, numericality: { only_integer: true, greater_than: 0, less_than: 120,
                                  message: "%{value} seems wrong, it must be less than 120" }

  scope :female, -> { where(sex: 1) }
  scope :male, -> { where(sex: 0)}
  scope :other, -> { where(sex: 2)}

  def self.name_order(param)
    self.order(first_name: :"#{param}")
  end

  def self.city_order(param)
    self.joins(:address).order("addresses.city #{param}")
  end

  def self.age_filter(param1, param2)
    self.where('age <= ? and age >= ?', param1, param2)
  end

  def name
    [first_name.presence, last_name.presence].compact.join(" ")
  end
end
