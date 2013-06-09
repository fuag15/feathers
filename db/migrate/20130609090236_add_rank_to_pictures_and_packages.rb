class AddRankToPicturesAndPackages < ActiveRecord::Migration
  def change
    add_column :pictures, 'rank', 'integer'
    add_column :packages, 'rank', 'integer'
  end
end
