require "modules/human_api_manager"
class SessionsController < ApplicationController

  def create
    auth   = env['omniauth.auth']
    email  = auth[:info][:email]
    token  = auth[:credentials][:token]
    user = User.where(email: email).first_or_create(humanapi_token: token,
                                             name: email)
    if user.save
      login_user(user)
      redirect_to challenges_path
    else
      render :text => "Some shit went wrong!"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
