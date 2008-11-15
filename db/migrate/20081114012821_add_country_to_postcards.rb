class AddCountryToPostcards < ActiveRecord::Migration
  def self.up
    add_column :postcards, :country, :string
  end

  def self.down
    remove_column :postcards, :country
  end
end
