class CreateAffiliateproducts < ActiveRecord::Migration[5.1]
  def change
    create_table :affiliate_products do |t|
      t.string :affiliate_product_title
      t.string :affiliate_product_description

      t.float :price 
      t.float :discount 
      t.integer :product_id 
      t.integer :affiliate_id 
      t.float :weight 
      t.integer :affiliate_product_id 
      t.string :affiliate_product_url 
      t.datetime :crawled_at 
      t.boolean :in_stock 
      t.timestamps
    end
  end
end
