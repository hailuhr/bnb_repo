class ReviewDescRatingGuest < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :rating, :integer
    add_column :reviews, :reservation_id, :integer
    add_column :reviews, :guest_id, :integer
  end
end
