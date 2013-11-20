require 'spec_helper'

describe Programme do
  describe 'Associations' do
    it { should belong_to :national_office }
    it { should have_many :villages }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :number }
    it { should validate_presence_of :national_office_id }
  end
end
