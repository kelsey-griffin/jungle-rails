class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    
    # Clean sign up form inputs
    user.name = user.name.strip.titlecase.to_s
    user.email = user.email.downcase.strip.to_s
      
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
