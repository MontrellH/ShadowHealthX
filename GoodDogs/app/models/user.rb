class User < ApplicationRecord
  has_secure_password
  has_many :dogs, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :shelter, optional: true

  def has_dog?(dog)
    votes.where(dog_id: dog.id).count > 0
  end
end
