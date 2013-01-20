class MobileUser < ActiveRecord::Base
  attr_accessible :name, :surname, :mobile_contact,
                  :alternative_contact, :next_of_kin, :mobile_of_kin,
                  :physical_address, :occupants_in_house_hold

end
