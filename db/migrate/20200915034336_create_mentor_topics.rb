class CreateMentorTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :mentor_topics do |t|
      t.references :mentor, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
