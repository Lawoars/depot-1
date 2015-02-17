class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :getTime, :getCart

  before_action :authorize
  
  protected
  def getTime 
    @time = Time.now.to_s(:time)
  end
  
  def getCart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    end
    
  end

  protected
  def authorize
    if User.count > 0
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: 'Пройдите авторизацию, пожалуйста.'
      end
    end

  end
end
