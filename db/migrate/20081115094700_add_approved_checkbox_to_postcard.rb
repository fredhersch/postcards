class AddApprovedCheckboxToPostcard < ActiveRecord::Migration
  def self.up
    add_column :postcards, :approved, :boolean    
  end

  def self.down
    remove_column :postcards, :approved, :boolean
  end
end
