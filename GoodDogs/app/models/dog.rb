class Dog < ApplicationRecord
  belongs_to :user
  validates :name, :breed, :description, presence: true,
                                         length: {minimum: 3}
end
