class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :getTime, :getCart

  before_action :authorize, :set_i18n_locale_from_params
  
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

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.map(&:to_s).include?(params[:locale])
        I18n.locale = params[:locale]
      else
        flash.now[:notice] = "#{params[:locale]} перевод недоступен"
        logger.error flash.now[:notice]
      end
    end
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
