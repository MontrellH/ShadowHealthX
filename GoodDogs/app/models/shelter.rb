class Shelter < ApplicationRecord
    has_many :users
    has_many :dogs, through: :users
end
