class AffiliateProduct < ApplicationRecord

    ### Relations
    belongs_to :affiliate, optional: true
    belongs_to :product, optional: true


end
