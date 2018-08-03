class Shelter < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :dogs, through: :users
end
