class User < ApplicationRecord
  has_secure_password
  has_many :dogs
  belongs_to :shelter
end
