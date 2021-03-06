class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    elsif User.count == 0
      session[:user_id] = -1
      redirect_to admin_url
    else
      redirect_to login_url, notice: 'Неправильный логин или пароль'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: 'Сеанс работы завершён'
  end
end
