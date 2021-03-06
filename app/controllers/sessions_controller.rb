class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  #es solo para evitar application.html.erb - esta bienvenida tiene distinto fondo
  layout 'session.html.erb'

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, :alert => 'Combinacion email / password invalida'
    end
  end

  def destroy
    session[:user_id] = nil
    #redirect_to landing_bienvenida_url, :notice => "Logged out"    
    redirect_to '/', :notice => "Logged out"
  end
end
