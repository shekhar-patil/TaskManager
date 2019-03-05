class User < ApplicationRecord
  has_many :tasks, dependent: :delete_all

  has_secure_password
  
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
