class User < ApplicationRecord
  has_secure_password
  has_many :orders, dependent: :destroy

  validates(:userid, presence: true, uniqueness: true)


end
