class CreatePerson < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.date :date_of_birth
      t.string :gender
      t.integer :zipcode
    end
  end
end
