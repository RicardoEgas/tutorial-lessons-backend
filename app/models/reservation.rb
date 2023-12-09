class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :tutorial

  validates :user_id, uniqueness: { scope: :tutorial_id, message: "has already made a reservation for this tutorial" }
end
