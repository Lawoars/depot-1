class AddAttachmentImageToProducts < ActiveRecord::Migration
  def up
    add_attachment :products, :image_url
  end

  def down
    remove_attachment :products, :image_url
  end
end
