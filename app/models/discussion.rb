class Discussion < ActiveRecord::Base
  belongs_to :village
  belongs_to :group
  has_many :conversations

  validates :lead_facilitator, :duration, :date_held, 
            :group_id, :village_id, presence: true
end
