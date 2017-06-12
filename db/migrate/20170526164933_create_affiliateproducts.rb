class CreateAffiliateproducts < ActiveRecord::Migration
  def change
    create_table :affiliate_products do |t|
      t.string :affiliate_product_title
      t.string :affiliate_product_description

      t.float :price 
      t.float :discount 
      t.integer :product_id 
      t.integer :affiliate_id 
      t.float :weight 
      t.string :affiliate_product_id 
      t.string :affiliate_product_url 
      t.string :affiliate_product_image_url
      t.datetime :crawled_at 
      t.boolean :in_stock
      t.boolean :published
      t.timestamps
    end
  end
end
