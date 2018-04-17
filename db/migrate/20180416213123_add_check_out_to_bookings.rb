class AddCheckOutToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :check_out, :datetime
  end
end
