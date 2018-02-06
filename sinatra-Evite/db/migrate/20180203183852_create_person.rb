class CreatePerson < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.date :date_of_birth
      t.string :gender
      t.string :zipcode
    end
  end
end
