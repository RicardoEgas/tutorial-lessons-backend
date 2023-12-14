class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }

  has_many :reservations, dependent: :destroy
  has_many :tutorials, through: :reservations
end
