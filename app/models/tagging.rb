class Tagging < ApplicationRecord
    ### Associations
    belongs_to :taggable, polymorphic: true
    belongs_to :tag

end
