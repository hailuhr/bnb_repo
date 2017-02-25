class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.date :checkin
      t.date :checkout
      t.integer :listing_id
      t.integer :guest_id
      t.integer :status, default: "pending"
      t.timestamps null: false
    end
  end
end
