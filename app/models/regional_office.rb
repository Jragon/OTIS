class RegionalOffice < ActiveRecord::Base
  has_many :national_offices, dependent: :destroy
  has_many :programmes, through: :national_offices
  has_many :groups, through: :national_offices
  has_many :changes, through: :national_offices

  validates :name, presence: true

  def top_change
    changes.merge(Change.top()).take
  end

  def changes_with_score
    changes.merge Change.with_ten_seed.top
  end  
end
