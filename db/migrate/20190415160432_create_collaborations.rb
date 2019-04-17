class CreateCollaborations < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborations do |t|
      t.integer :collaborator_id
      t.integer :collaboratee_id
      t.integer :collab_post_id

      t.timestamps
    end
  end
end
