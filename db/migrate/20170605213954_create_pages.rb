class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :page_type
      t.integer :parent_id
      t.boolean :enabled
      t.text :properties
      t.string :url
      t.text :content
      t.timestamps null: false
    end
  end
end
