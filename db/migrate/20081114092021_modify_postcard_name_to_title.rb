class ModifyPostcardNameToTitle < ActiveRecord::Migration
  def self.up
    rename_column "postcards", "name", "title"   
  end

  def self.down
    rename_column "postcards", "title", "name"   
  end
end
