class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :version
      t.string :file

      t.timestamps
    end
  end
end
