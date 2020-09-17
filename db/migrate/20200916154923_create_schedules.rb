class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.references :mentor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
