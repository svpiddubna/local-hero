class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :content, length: { minimum: 10 }

  def notify!(actor)
    Notification.create(recipient: post.user, actor: actor, action: 'commented', post: post)
  end
end
