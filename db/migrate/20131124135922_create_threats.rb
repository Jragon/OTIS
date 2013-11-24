class CreateThreats < ActiveRecord::Migration
  def change
    create_table :threats do |t|
      t.string :name
      t.string :rank
      t.text :observations

      t.timestamps
    end
  end
end
