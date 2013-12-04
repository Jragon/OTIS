class Theme < ActiveRecord::Base
  belongs_to :conversation
  has_many :fruit
end
