class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :tutorial

  def reserve_date_cannot_be_in_the_past
    return unless reserve_date.present? && reserve_date < Date.today

    errors.add(:reserve_date, "can't be in the past")
  end
end
