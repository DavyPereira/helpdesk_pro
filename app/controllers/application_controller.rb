class ApplicationController < ActionController::Base
  before_action :set_notifications

  private

  def set_notifications
    return unless user_signed_in?

    @unread_notifications_count = current_user.notifications.unread.count
  end

  def after_sign_in_path_for(_resource_or_scope)
    dashboard_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end