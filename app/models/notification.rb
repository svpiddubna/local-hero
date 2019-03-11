class Notification < ApplicationRecord
  belongs_to :post
  belongs_to :recipient, class_name: "User"
  belongs_to :actor, class_name: "User"

  scope :unread, -> { where read: false }
end
