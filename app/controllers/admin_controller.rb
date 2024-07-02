class AdminController < ApplicationController
  before_action :require_admin

  def new
  end

  def create
  end

  def destroy
  end

  private

  def require_admin
    unless current_user && current_user.role == 'admin'
      redirect_to root_path, alert: 'Access denied.'
    end
  end
end
