class AddStartTimeEndTimeToBookings < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :time, :start_time
    add_column :bookings, :end_time, :time
  end
end
