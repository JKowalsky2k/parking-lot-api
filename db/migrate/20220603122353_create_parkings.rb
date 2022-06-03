class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.string :city
      t.string :street
      t.string :address_number

      t.timestamps
    end
  end
end
