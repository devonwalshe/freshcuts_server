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
            description = ap['description'][0].strip unless ap['description'][0] == nil
            af = AffiliateProduct.find_or_create_by(price: ap['price'], discount: ap['discount'], weight: ap['weight'], affiliate_product_id: ap['product_id'], affiliate_product_url: ap['url'], crawled_at:ap['crawled_at'], affiliate_id:a.id, affiliate_product_title:ap['title'], affiliate_product_description:description, affiliate_product_image_url:ap['image_url']) 
        end

    end
    
    desc "bootstrap the application"
    task :all, :environment do
        `bundle exec rake db:create`
        `bundle exec rake db:migrate`
        `bundle exec rake bootstrap:bootstrap_data['donaldrussell_all2017-05-27T14-33-14.json']`


    end

end
        
