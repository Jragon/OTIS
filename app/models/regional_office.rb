class RegionalOffice < ActiveRecord::Base
  has_many :national_offices, dependant: :destroy
  has_many :changes, through: :national_offices

  validates :name, presence: true

  def top_change
    changes.merge(Change.top(false)).take
  end

  def changes_with_score
    changes.merge Change.with_ten_seed.top
  end  
end
