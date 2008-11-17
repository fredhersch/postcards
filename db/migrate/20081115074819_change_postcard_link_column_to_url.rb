class ChangePostcardLinkColumnToUrl < ActiveRecord::Migration
  def self.up
    rename_column "postcards", "link", "url"
  end

  def self.down
    rename_column "postcards", "url", "link"
  end
end
