class ReloacBidWinner < ActiveRecord::Migration
  def self.up
     remove_column :tasks, :user_id
     add_column :posts, :bid_winner_id, :integer
  end

  def self.down
      add_column :tasks, :user_id, :integer
      remove_column :posts, :bid_winner_id, :integer
  end
end
