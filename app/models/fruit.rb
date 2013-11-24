class Fruit < ActiveRecord::Base
  belongs_to :conversation
  has_many :threats
  has_many :contributors

  validates :conversation_id, :name, :rank, :ten_seed, presence: true
end
