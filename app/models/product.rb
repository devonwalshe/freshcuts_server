class Product < ApplicationRecord
    ### Associations
    has_many :affiliateproducts
    has_many  :taggings, :as => :taggable
    has_many  :tags, :through => :taggings

end
