class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mentor, null: false, foreign_key: true
      t.interval :total_duration
      t.decimal :total_price
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
