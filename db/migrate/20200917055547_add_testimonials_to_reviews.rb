class AddTestimonialsToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :testimonial, :text
  end
end
