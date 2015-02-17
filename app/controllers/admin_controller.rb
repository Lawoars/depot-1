class AdminController < ApplicationController
  def index
    if session[:user_id] != -1
      @user = User.find(session[:user_id])
    end
    @total_orders = Order.count
  end
end
