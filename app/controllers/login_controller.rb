class LoginController < ApplicationController
  def index
    params[:user_name] = 'super admin'
  end
  
  def login
    user = User.find_by_name(params[:user_name])
    if user.nil? || user.password != params[:password]
      flash[:error] = "wrong user_name or password" 
      render :action => :index
    else
      session[:user] = user
      redirect_to :controller => :users
    end
  end
end
