class AddUserToPostcards < ActiveRecord::Migration
    def self.up
    add_column :postcards, :user_id, :int
  end

  def self.down
    remove_column :postcards, :user_id
  end
end
