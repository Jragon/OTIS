require 'spec_helper'

describe Threat do  
  describe 'Associations' do
    it { should belong_to :fruit}
  end

  describe 'Validations' do
    it { should validate_presence_of :fruit_id }
    it { should validate_presence_of :name }
    it { should validate_presence_of :rank }
    it { should validate_presence_of :ten_seed }
  end
end
