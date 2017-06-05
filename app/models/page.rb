class Page < ActiveRecord::Base

    ### Associations
    has_many :taggings, as: :taggable, dependent: :destroy
    has_many :tags, :through => :taggings 

end

# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string
#  page_type  :string
#  parent_id  :integer
#  enabled    :boolean
#  properties :text
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
