class Course < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews, dependent: :destroy

  enum status: {
    Opening: 0,
    Started: 1,
    Finished: 2
  }

  scope :Opening, -> { where(status: 'Opening') }
  scope :Started, -> { where(status: 'Started') }
  scope :Finished, -> { where(status: 'Finished') }
end
