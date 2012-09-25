class CreateProductinfos < ActiveRecord::Migration
  def change
    create_table :productinfos do |t|
      t.string :product_name
      t.string :content
      t.string :category
      t.string :img_url
      t.integer :user_id

      t.timestamps
    end
    add_index :productinfos, [:user_id, :created_at]
  end
end
