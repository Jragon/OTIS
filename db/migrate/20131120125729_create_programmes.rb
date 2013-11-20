class CreateProgrammes < ActiveRecord::Migration
  def change
    create_table :programmes do |t|
      t.string :name
      t.integer :number
      t.integer :national_office_id

      t.timestamps
    end
  end
end
