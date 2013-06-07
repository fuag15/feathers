class CreateJobsPackages < ActiveRecord::Migration
  def change
    create_table :jobs_packages do |t|
      t.references :job
      t.references :package

      t.timestamps
    end
    add_index :jobs_packages, :job_id
    add_index :jobs_packages, :package_id
  end
end
