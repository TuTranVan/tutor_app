class Certificate < ApplicationRecord
  belongs_to :tutor

  validates :shool, presence: true
  validates :major, presence: true
  validates :grade, presence: true
  validates :course, presence: true
end
