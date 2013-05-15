class CreatePackagesProjects < ActiveRecord::Migration
  def change
    create_table :packages_projects do |t|
      t.references :package
      t.references :project

      t.timestamps
    end
    add_index :packages_projects, :package_id
    add_index :packages_projects, :project_id
  end
end
