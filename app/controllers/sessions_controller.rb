class SessionsController < ApplicationController
  def new
    render :layout => "forum"
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.username}."
      redirect_to_target_or_default("/")
    else
      flash[:error] = "Incorrect username and/or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out."
    redirect_to "/"
  end
end
