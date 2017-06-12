class AffiliateProduct < ApplicationRecord
    ### Callbacks
    before_create :add_tags, :add_images


    ### Relations
    belongs_to :affiliate
    belongs_to :product
    has_many :images, as: :imageable
    has_many :taggings, as: :taggable, dependent: :destroy
    has_many :tags, :through => :taggings

    ### Sunspot
    searchable do
        text :affiliate_product_title 
    end

    ### Scopes
    scope :no_images, -> {where.not(affiliate_product_image_url: nil).left_outer_joins(:images).where(images: {imageable_id: nil})}
    
    
    ### Class methods
    def add_tags
        if self.affiliate_product_title == nil
            return
        end
        ### Get tagslist from file
        require Rails.root + 'lib/import/meat_list.rb'
        list = MEAT_TAG_LIST.uniq
        ### Get index numbers of elements that exist in the title
        ap_title_tags = list.size.times.select{|i| self.affiliate_product_title.downcase.include?(list[i])}.map{|i| list[i]}.uniq
        ### Get or create tags and attach them to our AP object
        taglist = []
        ap_title_tags.each do |tag|
            t = Tag.where(name: tag).first_or_create
            taglist << t
        end
        self.tags = taglist
    end

    def add_images
        if self.affiliate_product_image_url == nil
            return
        end
        i = Image.new
        remote = open(self.affiliate_product_image_url)
        def remote.original_filename;base_uri.path.split('/').last; end
        i.asset = remote
        i.title = remote.original_filename
        self.images = [i]
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
#  affiliate_product_image_url   :string
#  crawled_at                    :datetime
#  in_stock                      :boolean
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
