class CreateRegionalOffices < ActiveRecord::Migration
  def change
    create_table :regional_offices do |t|
      t.string :name

      t.timestamps
    end
  end
end
