class Dog < ApplicationRecord
  before_create :init_points
  belongs_to :user
  validates :name, :breed, :description, presence: true,
                                         length: {minimum: 3}

                    #The rhs is a 'proc'
scope :by_points, -> { order points: :desc }

  def init_points
    self.points = 0
  end
end
