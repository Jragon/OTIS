class Programme < ActiveRecord::Base
  belongs_to :national_office
  has_many :villages
  has_many :discussions, through: :villages
  has_many :conversations, through: :discussions
  has_many :changes, through: :conversations

  validates :name, :number, :national_office_id, presence: true

  def top_change
    changes.merge Change.top_ranked(false)
  end
end
