class DeleteEmptyCarts < ActiveRecord::Migration
  def change
    Cart.all.each do |cart|
      if cart.line_items.empty?
        cart.destroy
      end
    end
  end
end
