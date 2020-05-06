class SessionsController < ApplicationController
  def new
    @login_errors = session[:login_errors]
  end

  def create
    
    user = User.authenticate_with_credentials(params[:user][:email], params[:user][:password])
    
    if user
      session[:user_id] = user.id
      session[:login_errors] = nil

      redirect_to '/'
    else
      session[:login_errors] = "Couldn't Authenticate Email or Password"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
