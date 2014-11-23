class User < ActiveRecord::Base
  has_many :media
  has_secure_password
  validates :name, presence: true
  validates :email, format: { with: /\A[A-Za-z]+@[a-z\.]+[a-z]\Z/ }
  validates :email, uniqueness: true
  
end
