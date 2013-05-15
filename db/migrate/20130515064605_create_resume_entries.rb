class CreateResumeEntries < ActiveRecord::Migration
  def change
    create_table :resume_entries do |t|
      t.string :name
      t.integer :rank
      t.references :resume_category

      t.timestamps
    end
    add_index :resume_entries, :resume_category_id
  end
end
