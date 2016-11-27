class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid

      t.timestamps null: false
      t.index :uid, unique: true 
    end
  end
end
