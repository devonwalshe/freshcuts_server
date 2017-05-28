class CreateAffiliates < ActiveRecord::Migration[5.1]
  def change
    create_table :affiliates do |t|
      t.string :title
      t.string :type
      t.string :reference
      t.string :fc_affiliate_key 
      t.timestamps
    end
  end
end
