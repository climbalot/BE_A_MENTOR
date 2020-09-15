class AddIndustryReference < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :industry, :string
    add_reference :users, :industry, foreign_key: true
  end
end
