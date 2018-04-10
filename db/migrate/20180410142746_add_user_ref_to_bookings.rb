class AddUserRefToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :user, foreign_key: true
  end
end
