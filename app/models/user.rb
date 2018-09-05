class User < ApplicationRecord
  has_many :pictures

  enum sex: { male: 0, female: 1, other: 2 }
end
