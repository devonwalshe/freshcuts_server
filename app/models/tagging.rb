class Tagging < ApplicationRecord
    ### Associations
    belongs_to :taggable, polymorphic: true
    belongs_to :tag

end

# == Schema Information
#
# Table name: taggings
#
#  id            :integer          not null, primary key
#  taggable_type :string
#  taggable_id   :integer
#  tag_id        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
