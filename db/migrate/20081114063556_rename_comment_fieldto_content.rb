class RenameCommentFieldtoContent < ActiveRecord::Migration
  def self.up
    rename_column "comments", "comment", "content"   
  end

  def self.down
    rename_column "comments", "content", "comment"   
  end
end
