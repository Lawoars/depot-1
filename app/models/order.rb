class Order < ActiveRecord::Base
  include CurrentPayTypes
  
  def set_pay_types
    @pay_types = get_current_types
    return @pay_types
  end
  
  #PAYMENT_TYPES = self.set_pay_types
  
  has_many :line_items, dependent: :destroy
  validates :name, :email, :address, presence: true
  validates_presence_of :pay_type
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  
 
  
end
