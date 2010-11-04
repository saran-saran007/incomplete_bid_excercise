class AddBidCountPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :bid_count, :integer
  end

  def self.down
    remove_column :posts, :bid_count
  end
end
