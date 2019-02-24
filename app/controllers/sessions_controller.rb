class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      sessions[:user_id] = user_id
      redirect_to admin_url
    else
      redirect_to login_url, alert:"Invalid username or Password"
    end
  end

  def destroy
    sessions[:user_id] = nil
    redirect_to login_url, alert:"Successfully logged out"
  end
end
