class CreateCollabPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :collab_posts do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :seeking

      t.timestamps
    end
  end
end
