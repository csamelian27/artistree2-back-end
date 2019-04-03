class CreateMediaItems < ActiveRecord::Migration[5.2]
  def change
    create_table :media_items do |t|
      t.string :title
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
