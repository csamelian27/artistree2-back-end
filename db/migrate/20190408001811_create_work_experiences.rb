class CreateWorkExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :work_experiences do |t|
      t.integer :user_id
      t.string :business_name
      t.string :description
      t.integer :year_began
      t.integer :year_ended

      t.timestamps
    end
  end
end
