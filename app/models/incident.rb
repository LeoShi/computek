class Incident < ActiveRecord::Base
  CATEGORY = {"House Break in" => "HSB", "Domestic Violence" => "DOV",
              "Hijack" => "HIJ", "Suspects" => "SUS",
              "Animal abuse" => "AAB", "Shooting" => "SHO",
              "Murder" => "MUR", "Illegal Firearm" => "ILF",
              "Drug Dealing" => "DRD", "Drug Use" => "DRU"}
  STATUS = ["Open", "In Progress", "Suspended", "Withdrawn", "Closed"]

  attr_accessible :category, :mobile_user, :mobile_user_id, :status,
                  :reference, :location_attributes, :location, :user, :user_id
  belongs_to :mobile_user
  belongs_to :user
  has_one :location
  accepts_nested_attributes_for :location

  validates_presence_of :location, :mobile_user, :category
  before_create :generate_reference_number
  before_save :default_values

  private
  def default_values
    save_default_user
    self.status ||= STATUS[0]
  end

  def generate_reference_number
    self.reference = "%s%d" % [CATEGORY[self.category], Time.now.to_i]
  end

  def save_default_user
    self.user ||= User.find_by_role("dispatcher") if self.user.nil?
  end
end
