class AddCheckInToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :check_in, :datetime
  end
end
