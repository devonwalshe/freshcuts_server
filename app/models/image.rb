class Image < ApplicationRecord

    ### Relations
    belongs_to :imageable, polymorphic: true



    ### Paperclip
    #validates_attachment_content_type :asset, content_type: /\Aimage\/.*\z/
    has_attached_file :asset,
                      :styles => {:large => "1000x1000>", :medium=> "600x600>", :small=>"300x300>"}, 
                      :path => "public/images/:id/:id_:style_:filename",
                      :url => "images/:id/:id_:style_:filename",
                      # :default_url => "asset_placeholders/:style.png",
                      :convert_options => { :all => "-strip -colorspace RGB" },
                      :whiny => true,
                      :storage => :filesystem

    validates_attachment :asset,
                         content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end

# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  title              :string
#  imageable_type     :string
#  imageable_id       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  asset_file_name    :string
#  asset_content_type :string
#  asset_file_size    :integer
#  asset_updated_at   :datetime
#
