class FixNameForAddress < ActiveRecord::Migration
  def change
    rename_column :addresses, :city, :phone
    rename_column :addresses, :street, :city
    rename_column :addresses, :name, :street
  end
end
