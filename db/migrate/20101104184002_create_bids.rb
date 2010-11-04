class CreateBids < ActiveRecord::Migration
  def self.up
    create_table :bids do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bids
  end
end
