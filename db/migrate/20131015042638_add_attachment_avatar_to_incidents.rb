class AddAttachmentAvatarToIncidents < ActiveRecord::Migration
  def self.up
    add_attachment :incidents, :avatar
  end

  def self.down
    remove_attachment :incidents, :avatar
  end
end
