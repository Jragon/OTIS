class Threat < ActiveRecord::Base
  belongs_to :fruit

  validates :fruit_id, :name, :rank, presence: true
  validates :name, :rank, uniqueness: { scope: :fruit_id } 
end