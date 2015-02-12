class CombinePriceToLineItems < ActiveRecord::Migration
  def up
    
    LineItem.all.each do |item|
      product = Product.find(item.product_id)
      item.price = product.price
      item.save!
    end
  end
end
