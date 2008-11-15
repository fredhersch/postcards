class AddAttachmentsPhotoToPostcard < ActiveRecord::Migration
  def self.up
    add_column :postcards, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :postcards, :photo_updated_at
  end
end
