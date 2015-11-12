class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :amount
      t.text :detail
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
