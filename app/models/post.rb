class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :attendances, dependent: :destroy
  validates :title, :content, :type, presence: true
# scope :tasks, -> { where(type: 'Task') }
# scope :questions, -> { where(type: 'Question') }
# scope :events, -> { where(type: 'Event') }
end
