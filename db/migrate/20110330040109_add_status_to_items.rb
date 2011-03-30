class AddStatusToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :status, :integer
  end

  def self.down
    remove_column :items, :status
  end
end
