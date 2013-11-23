require 'spec_helper'

describe Discussion do
  describe 'Associations' do
    it { should belong_to :village }
    it { should belong_to :group }
    it { should have_many :conversations }
  end

  describe 'Validations' do
    it { should validate_presence_of :lead_facilitator }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :date_held }
    it { should validate_presence_of :group_id }
    it { should validate_presence_of :village_id }
  end
end
