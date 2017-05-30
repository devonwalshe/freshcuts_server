class SearchController < ApplicationController



    def search
        @search = AffiliateProduct.search do |query| 
            query.paginate(page: params[:page] || 1, per_page: params[:per_page] || 30)
            query.fulltext params[:q]
        end
        #console
        @results = @search.results
        respond_to do |format|
            format.html
            #format.js {render 'scroll_results'}
            if params['search_type'] == "scroll"
                format.js {render 'scroll_results'}
            else
                format.js {render 'full_results'}
            end
        end
    end

end
