class AddImageToStreams < ActiveRecord::Migration
  def self.up
    add_attachment :streams, :image
  end

  def self.down
    remove_attachment :streams, :image
  end
end
