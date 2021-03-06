class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
    end
    redirect_to "/#{current_user.nickname}"
  end

  def destroy
    flash[:notice] = 'You have logged out'
    session.clear
    redirect_to root_path
  end
end
