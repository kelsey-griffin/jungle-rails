class UsersController < ApplicationController
  def new
    @signup_errors = session[:signup_errors]
  end

  def create
    user = User.new(user_params)
    # Clean sign up form inputs
    user.name = user.name.strip.titlecase.to_s
    user.email = user.email.downcase.strip.to_s
      
    if user.save
      session[:user_id] = user.id
      session[:signup_errors] = nil
      redirect_to '/'
    else
      session[:signup_errors] = user.errors.full_messages
      redirect_to '/signup'
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
