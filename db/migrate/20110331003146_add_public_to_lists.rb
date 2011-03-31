class AddPublicToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :public, :integer
  end

  def self.down
    remove_column :lists, :public
  end
end
