require 'spec_helper'

describe Change do
  describe 'Associations' do
    # it { should have_many :discussions }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
  end
end
