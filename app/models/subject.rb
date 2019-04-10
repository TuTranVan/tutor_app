class Subject < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :majors, dependent: :destroy
  has_many :tutors, through: :majors

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
