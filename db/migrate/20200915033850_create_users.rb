class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :location
      t.string :industry
      t.text :description
      t.string :education
      t.integer :experience_years
      t.string :job_title

      t.timestamps
    end
  end
end
