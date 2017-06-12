class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
      t.string :title
      t.string :type
      t.string :reference
      t.string :fc_affiliate_key 
      t.string :website_url
      t.timestamps
    end
  end
end
