### Bootstrap functions for freshcuts

namespace :bootstrap do
    require 'json'
    desc "import datafile to the database"
    task :bootstrap_data, [:file_name] => :environment do |t, args|
        root = Rails.root 
        file_name = args[:file_name] 
        ###Import file
        affiliate_products = JSON.parse(File.read("#{root}/lib/import/#{file_name}"))
        
        ### Save each record to the database
        a = Affiliate.find_or_create_by(:title => "Donald Russell", :reference => "donaldrussell", :fc_affiliate_key => "")
        affiliate_products.each do |ap| 
            # ["description", "title", "price", "discount", "weight", "url", "product_id", "in_stock", "image_url", "crawled_at"]
            #["id", "price", "discount", "product_id", "name", "affiliate_id", "weight", "affiliate_product_id", "affiliate_product_url", "crawled_at", "in_stock", "created_at", "updated_at"] 
            af = AffiliateProduct.find_or_create_by(price: ap['price'], discount: ap['discount'], weight: ap['weight'], affiliate_product_id: ap['product_id'], affiliate_product_url: ap['url'], crawled_at:ap['crawled_at'], affiliate_id:a.id, affiliate_product_title:ap['title'], affiliate_product_description:ap['description'] ) 
#  affiliate_product_url :string
#  crawled_at            :datetime
#  in_stock              :boolean
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
        end

    end

end
        
