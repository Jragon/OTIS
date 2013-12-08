class AddParticipantsToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :participants, :integer
  end
end
