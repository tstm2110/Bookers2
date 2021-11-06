class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
  t.integer:follow
  t.integer:follower
  t.integer :followed
  t.integer :user_id
  t.integer :book_id
  t.integer :follower_id
  t.integer :followed_id


      t.timestamps
    end
  end
end
