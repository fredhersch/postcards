class DropTableComments < ActiveRecord::Migration
  def self.up
    drop_table :comment
  end

  def self.down
    
  end
end
