class SessionsController < ApplicationController
  before_action :no_autorize, only: %i[new create]
  before_action :autorize, only: :destroy
  def new
  end

  def create
  
    @user = User.find_by(email: params[:email])
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:user_nick] = @user.nick
      flash[:success] = 'you have successfully logged in'
      redirect_to form_path
    else
      flash[:error] = 'Incorrect password or email'
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    flash[:success] = 'Successful exit'
    redirect_to root_path
  end
end
