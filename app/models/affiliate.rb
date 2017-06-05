class Affiliate < ApplicationRecord

    ### Associations
    has_many :affiliateproducts

end

# == Schema Information
#
# Table name: affiliates
#
#  id               :integer          not null, primary key
#  title            :string
#  type             :string
#  reference        :string
#  fc_affiliate_key :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
