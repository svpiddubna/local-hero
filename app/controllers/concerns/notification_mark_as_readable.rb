require 'active_support/concern'

module NotificationMarkAsReadable
  extend ActiveSupport::Concern

  included do
    after_action :mark_notification_as_read,
                 only: :show,
                 if: ->{ params[:mark_read].present? }
  end

  private

  def mark_notification_as_read
    notification = Notification.find(params[:mark_read].to_i)
    notification.update(read: true)
  end
end
