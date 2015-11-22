class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.string :session_id
      t.integer :product_id
      t.string :page_name
      t.text :detail

      t.timestamps null: false
    end
  end
end
