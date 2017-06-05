### Image functions for fc server


namespace :images do 

    desc "Download image urls for scraped affiliate products"
    task :process_new => :environment do
        # Get list of all affiliate products that have an image url
        # but don't have an image saved for them yet
        unprocessed_aps = AffiliateProduct.no_images
        pb = ProgressBar.create(:title => "Importing Assets", :starting_at => 0, :total => unprocessed_aps.count, :format => '%a <%B> %p%% %r %c/%C')
        unprocessed_aps.each do |ap|
            pb.log "Processing images for #{ap.affiliate_product_title} - #{ap.affiliate_product_image_url}"
            i = Image.new
            remote = open(ap.affiliate_product_image_url)
            def remote.original_filename;base_uri.path.split('/').last; end
            i.asset = remote
            i.title = remote.original_filename
            ap.images = [i]
            ap.save
            pb.increment   
        end    
    end



end

