class AddMoreIndices < ActiveRecord::Migration
  def self.up
    add_index :forum_posts, :owner_id
    add_index :forum_topics, :owner_id
  end

  def self.down
    remove_index :forum_posts, :owner_id
    remove_index :forum_topics, :owner_id
  end
end
