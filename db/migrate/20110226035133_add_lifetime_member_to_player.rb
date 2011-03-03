class AddLifetimeMemberToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :lifetime_member, :boolean
  end

  def self.down
    remove_column :players, :lifetime_member
  end
end
