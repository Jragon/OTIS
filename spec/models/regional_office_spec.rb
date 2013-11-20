require 'spec_helper'

describe RegionalOffice do
  describe 'Associations' do
    it { should have_many :national_offices }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
  end
end
