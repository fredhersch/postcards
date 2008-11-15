class AddCounterCacheToPostcards < ActiveRecord::Migration
  def self.up
    add_column :postcards, :votes_count, :integer, :default => 0
    Postcard.find(:all).each do |p|
      p.update_attribute  :votes_count, p.votes.length
    end
  end

  def self.down
    remove_column :postcards, :votes_count
  end
end
