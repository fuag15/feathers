class CreatePicturesProjects < ActiveRecord::Migration
  def change
    create_table :pictures_projects do |t|
      t.references :picture
      t.references :project

      t.timestamps
    end
    add_index :pictures_projects, :picture_id
    add_index :pictures_projects, :project_id
  end
end
