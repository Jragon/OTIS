class Village < ActiveRecord::Base
  belongs_to :programme
  has_many :discussions

  validates :name, :programme_id, presence: true
end
