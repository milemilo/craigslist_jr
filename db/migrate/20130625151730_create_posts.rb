class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :price
      t.string :location
      t.string :image
      t.integer :category_id
    end
  end
end
