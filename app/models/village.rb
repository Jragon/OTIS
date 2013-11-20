class Village < ActiveRecord::Base
  belongs_to :programme

  validates :name, :programme_id, presence: true
end
