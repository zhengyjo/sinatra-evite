class CreateRegistration < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.integer :person_id
      t.integer :event_id
      t.string :status
    end
  end
end
