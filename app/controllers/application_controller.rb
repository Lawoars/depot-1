class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :getTime
  
  protected
  def getTime 
    @time = Time.now.to_s(:time)
  end
end
