class User < ApplicationRecord
  has_many :posts,dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password
end
