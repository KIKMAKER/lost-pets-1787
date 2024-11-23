class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.date :date_found
      t.string :location

      t.timestamps
    end
  end
end
