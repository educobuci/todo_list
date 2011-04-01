class CreateListsUsers < ActiveRecord::Migration
  def self.up
    create_table :lists_users, :id => false do |t|
      t.references :list
      t.references :user
    end
  end

  def self.down
    drop_table :lists_users
  end
end
