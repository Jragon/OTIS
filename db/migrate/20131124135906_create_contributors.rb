class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :name
      t.string :rank
      t.text :observations

      t.timestamps
    end
  end
end
