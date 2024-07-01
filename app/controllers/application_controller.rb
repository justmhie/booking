class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_user_is_admin?  # Ensure current_user_is_admin? is also added here

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_user_is_admin?
    current_user && current_user.user_role&.role == 'admin'
  end
end
