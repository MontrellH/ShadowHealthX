class User < ApplicationRecord
  has_secure_password
  has_many :dogs
  has_many :votes
  belongs_to :shelters

  def has_dog?(dog)
    votes.where(dog_id: dog.id).count > 0
  end
end
