class SearchController < ApplicationController

    def search
        @search = AffiliateProduct.search do |query| 
            query.fulltext params[:q]
        end
    end

end
