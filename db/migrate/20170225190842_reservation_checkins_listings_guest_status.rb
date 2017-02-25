class ReservationCheckinsListingsGuestStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :checkin, :date
    add_column :reservations, :checkout, :date
    add_column :reservations, :listing_id, :integer
    add_column :reservations, :guest_id, :integer
    add_column :reservations, :status, :string, default: "pending"
  end
end
