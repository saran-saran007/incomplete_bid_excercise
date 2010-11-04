class RemoveBidcountTask < ActiveRecord::Migration
  def self.up
     remove_column :tasks, :bid_count
  end

  def self.down
     add_column :tasks, :bid_count, :integer
  end
end
