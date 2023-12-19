require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    # let(:reservation) { create(:reservation) }
    let(:reservation) { build(:reservation) }

    it 'should be valid with correct params' do
        reservation.reserve_date = Faker::Date.forward(days: 23)
        expect(reservation).to be_valid
      end