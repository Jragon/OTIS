class RegionalOffice < ActiveRecord::Base
  has_many :national_offices

  validates :name, presence: true
end
