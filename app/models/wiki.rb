class Wiki < ApplicationRecord
  belongs_to :user

  validates :title, :body, presence: true
  validates :title, uniqueness: true
end
