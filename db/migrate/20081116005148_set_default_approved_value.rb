class SetDefaultApprovedValue < ActiveRecord::Migration
  def self.up
    @postcards = Postcard.find(:all)
      @postcards.each do |p|
        p.update_attribute(:approved, false)
      end
  end

  def self.down
  end
end
