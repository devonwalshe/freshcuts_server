# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
    ### Associations
    has_many :affiliateproducts
    has_many  :taggings, :as => :taggable
    has_many  :tags, :through => :taggings

end
