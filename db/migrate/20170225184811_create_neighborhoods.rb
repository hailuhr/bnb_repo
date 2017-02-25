class CreateNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.integer :city_id
      t.timestamps null: false
    end
  end
end
