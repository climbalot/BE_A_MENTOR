class ChangeTableRatingToReview < ActiveRecord::Migration[6.0]
  def change
    rename_table :ratings, :reviews
  end
end
