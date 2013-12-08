class Programme < ActiveRecord::Base
  belongs_to :national_office
  has_many :villages, dependent: :destroy
  has_many :discussions, through: :villages
  has_many :conversations, through: :discussions
  has_many :changes, through: :villages

  validates :name, :number, :national_office_id, presence: true
  validates :name, :number, uniqueness: { scope: :national_office_id }
  validates :number, length: { minimum: 5, maximum: 5 }

  def top_change
    changes.merge(Change.top(false)).take
  end

  def changes_with_score
    changes.merge Change.with_ten_seed.top
  end
end
