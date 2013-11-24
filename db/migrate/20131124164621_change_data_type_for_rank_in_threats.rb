class ChangeDataTypeForRankInThreats < ActiveRecord::Migration
  def up
    connection.execute(%q{
      alter table threats
      alter column rank
      type integer using cast(rank as integer)
    })
  end
end
