class Programme < ActiveRecord::Base
  belongs_to :national_office
  has_many :villages

  validates :name, :number, :national_office_id, presence: true
end
