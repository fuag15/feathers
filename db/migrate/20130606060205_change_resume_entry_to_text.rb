class ChangeResumeEntryToText < ActiveRecord::Migration
  def change
    change_column :resume_entries, :name, :text, limit: nil
  end
end
