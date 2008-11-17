class RemoveSummaryFieldFromPostcards < ActiveRecord::Migration
  def self.up
    remove_column :postcards, :summary
  end

  def self.down
    add_column :postcards, :summary, :text
  end
end
