# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module CurrentCart extend ActiveSupport::Concern

  private
  def set_cart
    if session[:counter].nil?
      session[:counter] = 0
    end
    session[:counter] = 0
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end
