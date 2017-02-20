class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :current_admin?, :executive

  def current_user
    if @current_user
      @current_user
    elsif session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      nil
    end
  end

  def current_admin?
    if current_user && current_user.role == 1
      true
    else
      false
    end
  end

  def current_executive?
    if current_user.role == 3
      true
    else
      false
    end
  end

end
