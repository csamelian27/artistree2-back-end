class CreateWorkExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :work_experiences do |t|
      t.integer :user_id
      t.string :business_name
      t.string :description
      t.string :contact_person
      t.string :contact_number
      t.string :months_range 

      t.timestamps
    end
  end
end
