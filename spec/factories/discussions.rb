# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :discussion do
    lead_facilitator "MyString"
    duration 1
    date_held "2013-11-21 18:08:13"
    group_id 1
    village_id 1
  end
end
