class RemoveVersionFromProjects < ActiveRecord::Migration
  def change
    remove_column 'projects', 'version'
  end
end
