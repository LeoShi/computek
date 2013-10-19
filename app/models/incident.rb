class Incident < ActiveRecord::Base
  CATEGORY = {"Abduction" => "ABD", "Domestic Violence" => "DOV",
              "Armed Robbery" => "ARB", "Hijack" => "HIJ",
              "Arson" => "ARS", "Shooting" => "SHO",
              "Assault" => "ASL", "Murder" => "MUR",
              "Attempted Murder" => "ATM", "Rape" => "RAP",
              "Bombing" => "BOM", "Fighting" => "FIG",
              "Terror Attack" => "TAT", "Terror Suspect" => "TSU"
  }
  STATUS = ["Open", "In Progress", "Suspended", "Withdrawn", "Closed"]

  attr_accessible :category, :mobile_user, :mobile_user_id, :status,
                  :reference, :location_attributes, :location, :user, :user_id

  attr_accessible :avatar
  has_attached_file :avatar,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/assets/missing.png"
  validates_attachment :avatar,
                       :content_type => { :content_type => "image/jpeg" },
                       :size => { :in => 0..10.megabytes }

  belongs_to :mobile_user
  belongs_to :user
  has_one :location
  accepts_nested_attributes_for :location

  validates_presence_of :location, :mobile_user, :category
  before_create :generate_reference_number
  before_save :default_values

  def as_json(options={})
    {:id => self.id,
     :category => CATEGORY.select{|name, _| name == self.category}.first.first,
     :location => self.location.street,
     :updated_at => self.updated_at.to_s(:short),
     :created_at => self.created_at.to_s(:short),
     :reference => self.reference,
     :status => self.status,
     :mobile_user_contact => self.mobile_user.mobile_contact,
     :mobile_user_name => self.mobile_user.name }
  end

  private
  def default_values
    save_default_user
    self.status ||= STATUS[0]
  end

  def generate_reference_number
    self.reference = "%s%d" % [CATEGORY[self.category], Time.now.to_i]
  end

  def save_default_user
    self.user ||= User.find_by_role("control_officer") if self.user.nil?
  end
end
