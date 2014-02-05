class AddArtToExpos < ActiveRecord::Migration
  def self.up
    add_attachment :expos, :art
  end

  def self.down
    remove_attachment :expos, :art
  end
end
