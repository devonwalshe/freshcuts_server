require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
