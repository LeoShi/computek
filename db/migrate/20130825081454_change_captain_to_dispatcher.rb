class ChangeCaptainToDispatcher < ActiveRecord::Migration
  def up
    User.find_all_by_role("captain").each {|user| user.role="dispatcher"; user.save}
  end

  def down
    User.find_all_by_role("dispatcher").each {|user| user.role="captain"; user.save}
  end
end
