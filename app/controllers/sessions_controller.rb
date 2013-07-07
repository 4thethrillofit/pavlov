require "modules/human_api_manager"
class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    auth   = env['omniauth.auth']
    p auth
    p "***********************************"
    p uid    = auth[:uid]
    p email  = auth[:info][:email]
    p token  = auth[:credentials][:token]
    user = User.where(email: email).first_or_create(humanapi_token: token,
                                             name: email)
    if user.save
      "******************"
      login_user(user)
      redirect_to root_path
    else
      render :text => "Some shit went wrong!"
    end
  end

  def failure
  end
end
