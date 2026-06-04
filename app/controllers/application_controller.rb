class ApplicationController < ActionController::Base
  before_action :set_notifications

  private

  def set_notifications
    return unless user_signed_in?

    @unread_notifications_count = current_user.notifications.unread.count
  end
end