class UpdatePostcardsFields < ActiveRecord::Migration
  def self.up
    remove_column :postcards, :year
    add_column  :postcards, :location, :string
  end

  def self.down
    add_column :postcards, :year, :string 
    remove_column :postcards, :location
  end
end
