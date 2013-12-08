class Discussion < ActiveRecord::Base
  belongs_to :village
  belongs_to :group
  has_many :conversations
  has_many :changes, through: :conversations

  validates :lead_facilitator, :duration, :participants, :date_held, 
            :group_id, :village_id, presence: true

  def top_change
    changes.merge(Change.top(false)).take
  end

  def group_name
    group.try(:name)
  end

  def group_name= name
    self.group = Group.find_or_create_by(name: name) if name.present?
  end
end
