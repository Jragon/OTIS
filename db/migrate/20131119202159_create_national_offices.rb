class CreateNationalOffices < ActiveRecord::Migration
  def change
    create_table :national_offices do |t|
      t.string :name
      t.integer :regional_office_id

      t.timestamps
    end
  end
end
