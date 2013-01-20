FactoryGirl.define do
  factory :mobile_user do
    name "John"
    surname "Doe"
    mobile_contact "12344"
    alternative_contact "45321"
    next_of_kin "Brain"
    mobile_of_kin "678945"
    physical_address "17 Melle street"
    occupants_in_house_hold "unknown"
  end
end