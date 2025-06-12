class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  validates :password, length: { minimum: 8 }
end
