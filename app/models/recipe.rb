class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, through: :users
  validates :title, presence: true
  validates :body, presence: true
end
