class Wiki < ApplicationRecord
  belongs_to :user
  after_initialize :set_default_to_public

  validates :title, :body, presence: true
  validates :title, uniqueness: true

  scope :public_wikis, -> { where(private: false) }
  scope :private_wikis, -> { where(private: true) }

  private
  def set_default_to_public
  	self.private ||= false
  end
end
