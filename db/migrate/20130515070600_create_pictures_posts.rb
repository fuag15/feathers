class CreatePicturesPosts < ActiveRecord::Migration
  def change
    create_table :pictures_posts do |t|
      t.references :post
      t.references :picture

      t.timestamps
    end
    add_index :pictures_posts, :post_id
    add_index :pictures_posts, :picture_id
  end
end
