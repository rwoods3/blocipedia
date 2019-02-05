class User < ApplicationRecord
	after_initialize :set_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :wikis

    enum role: [:standard, :premium, :admin]

    private
    def set_default_role
    	self.role ||= :standard
	end
end
