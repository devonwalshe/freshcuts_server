class AffiliateProduct < ApplicationRecord

    ### Relations
    belongs_to :affiliate, optional: true
    belongs_to :product, optional: true

    ### Sunspot
    searchable do
        text :affiliate_product_title 
    end

end

# == Schema Information
#
# Table name: affiliate_products
#
#  id                            :integer          not null, primary key
#  affiliate_product_title       :string
#  affiliate_product_description :string
#  price                         :float
#  discount                      :float
#  product_id                    :integer
#  affiliate_id                  :integer
#  weight                        :float
#  affiliate_product_id          :integer
#  affiliate_product_url         :string
#  crawled_at                    :datetime
#  in_stock                      :boolean
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
