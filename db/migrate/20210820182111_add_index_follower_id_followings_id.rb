class AddIndexFollowerIdFollowingsId < ActiveRecord::Migration[6.1]
  def change
    add_index :follows, [:follower_id, :following_id], :unique => true
    add_index :follows, [:following_id, :follower_id], :unique => true
  end
end
