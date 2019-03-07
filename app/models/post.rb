class Post < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :participants, through: :attendances, source: :user
  has_many :comments
end
