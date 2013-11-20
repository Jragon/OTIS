class NationalOffice < ActiveRecord::Base
  belongs_to :regional_office
  has_many :programmes

  validates :name, :regional_office_id, presence: true
end
