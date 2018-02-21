class CreateWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :workers do |t|
      t.string :rut
      t.string :first_name
      t.string :middle_name
      t.string :last_name1
      t.string :last_name2
      t.date :bithdate
      t.string :gender
      t.string :email
      t.string :phone
      t.string :address_region
      t.string :address_city
      t.string :address_street
      t.string :address_number
      t.string :address_apartment

      t.timestamps
    end
  end
end
