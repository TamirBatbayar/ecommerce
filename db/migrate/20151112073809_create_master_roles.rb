class CreateMasterRoles < ActiveRecord::Migration
  def change
    create_table :master_roles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
