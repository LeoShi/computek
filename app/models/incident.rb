class Incident < ActiveRecord::Base
  CATEGORY = {"House Break in" => "HSB", "Domestic Violence" => "DOV",
              "Hijack" => "HIJ", "Suspects" => "SUS",
              "Animal abuse" => "AAB", "Shooting" => "SHO",
              "Murder" => "MUR", "Illegal Firearm" => "ILF",
              "Drug Dealing" => "DRD", "Drug Use" => "DRU"}

  attr_accessible :category, :user, :status, :reference, :location_attributes, :location, :user_id
  belongs_to :user
  has_one :location
  accepts_nested_attributes_for :location

  validates_presence_of :location, :user, :category
  before_create :generate_reference_number

  private
  def generate_reference_number
    self.reference = "%s%d" % [CATEGORY[self.category], Time.now.to_i]
  end

end
