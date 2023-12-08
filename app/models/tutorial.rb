class Tutorial < ApplicationRecord
  belongs_to :tutor
  has_many :reservations
  has_many :users, through: :reservations
end
