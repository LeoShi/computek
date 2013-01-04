class Location < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :street, :incident
  belongs_to :incident
  validates_presence_of :latitude, :longitude
end
