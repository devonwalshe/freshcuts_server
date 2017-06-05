class AddAttachmentImageToImages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :images do |t|
      t.attachment :asset
    end
  end

  def self.down
    remove_attachment :images, :asset
  end
end
