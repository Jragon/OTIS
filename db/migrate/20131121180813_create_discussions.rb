class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :lead_facilitator
      t.integer :duration
      t.datetime :date_held
      t.integer :group_id
      t.integer :village_id

      t.timestamps
    end
  end
end
