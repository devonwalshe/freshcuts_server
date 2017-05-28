class SearchController < ApplicationController

    def search
        console
        @search = AffiliateProduct.search do |query| 
            query.fulltext params[:q]
        end
    end

end
