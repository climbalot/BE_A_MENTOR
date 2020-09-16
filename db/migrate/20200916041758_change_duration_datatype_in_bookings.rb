class ChangeDurationDatatypeInBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :total_duration, :interval
    add_column :bookings, :duration_in_minutes, :integer
  end
end
