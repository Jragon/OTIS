class Village < ActiveRecord::Base
  belongs_to :programme
  has_many :discussions
  has_many :conversations, through: :discussions
  has_many :changes, through: :conversations

  validates :name, :programme_id, presence: true
  
  def top_change
    changes.merge(Change.top(false)).take
  end
end
