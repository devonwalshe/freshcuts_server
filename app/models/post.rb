class Post < ApplicationRecord

    ### Associations
    has_many :taggings, as: :taggable, dependent: destroy
    has_many :tags, :through => :taggings

end

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  abstract   :text
#  standfirst :text
#  footnote   :text
#  template   :text
#  user_id    :integer
#  published  :boolean
#  featured   :boolean
#  created_at :datetime
#  updated_at :datetime
#
