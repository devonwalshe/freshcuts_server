class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :abstract
      t.text :standfirst
      t.text :footnote
      t.text :template
      t.integer :user_id
      t.boolean :published
      t.boolean :featured

      t.timestamps
    end
  end
end
