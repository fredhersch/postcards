class CreatePostcards < ActiveRecord::Migration
  def self.up
    create_table :postcards do |t|
      t.string :name
      t.string :year
      t.text :summary
      t.text :description
      t.string :organisation
      t.string :link
      t.text :tips
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :postcards
  end
end
