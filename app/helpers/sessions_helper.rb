module SessionsHelper
  def current_user
    @current_user ||= User.where(session[:user_id]).first if session[:user_id]
  end
  def login_user(user)
    session[:user_id] = user.id
  end
end
