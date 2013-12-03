class Fruit < ActiveRecord::Base
  acts_as_list

  belongs_to :conversation
  has_many :threats, dependent: :destroy
  has_many :contributors, dependent: :destroy

  validates :conversation_id, :name, :rank, :ten_seed, presence: true
end
