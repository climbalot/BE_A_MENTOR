class CreateMentors < ActiveRecord::Migration[6.0]
  def change
    create_table :mentors do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :hourly_rate

      t.timestamps
    end
  end
end
