class AddStatusToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :status, :string
  end
end
