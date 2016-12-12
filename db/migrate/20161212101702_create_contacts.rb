class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name, :null=>false
      t.string :surname, :null=>false
      t.string :phone
      t.string :email
      t.string :web
      t.string :city
      t.string :address
      t.integer :country_id, :null=>false

      t.timestamps
    end
    add_index :contacts, :country_id
  end
end
