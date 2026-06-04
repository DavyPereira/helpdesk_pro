class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  scope :unread, -> { where(read: false) }

  after_create_commit -> {
    broadcast_replace_to(
      "notifications_#{user.id}",
      target: "notifications_count",
      partial: "notifications/count",
      locals: { user: user }
    )
  }
end