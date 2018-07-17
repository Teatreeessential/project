class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :project_title
      t.string :project_contents
      t.string :project_start
      t.string :project_end
      t.integer :project_people_no
      t.integer :project_view
      t.integer :project_complete
      t.integer :skill_id
      t.integer :category_id
      t.timestamps
    end
  end
end
