class ChangeColumNumberOnProgrammesToString < ActiveRecord::Migration
  def change
    change_column :programmes, :number, :string
  end
end
