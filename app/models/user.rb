class User < ApplicationRecord
  has_many :programs, dependent: :destroy
  has_secure_password
  validates_presence_of :first_name, :email, :password
  validates_uniqueness_of :email
end
