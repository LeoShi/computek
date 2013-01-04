class Incident < ActiveRecord::Base
  attr_accessible :category, :user, :status, :reference, :location_attributes, :location
  belongs_to :user
  has_one :location
  accepts_nested_attributes_for :location

  validates_presence_of :location, :user, :category

end
