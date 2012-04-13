module LoginAble
  class LoginAbleController < ApplicationController
    def check_login
      flash[:error] = "please login .."
      redirect_to :controller => :login unless session[:user]
    end
  end
end