class Threat < ActiveRecord::Base
  belongs_to :fruit

  validates :fruit_id, :name, :rank, :ten_seed, presence: true
end