class AddStreamToUsers < ActiveRecord::Migration
  def self.up
    add_attachment :users, :streams
  end

  def self.down
    remove_attachment :users, :streams
  end
end
