class Rating < ApplicationRecord
  belongs_to :tutor
  belongs_to :student

  validates :score, presence: true, numericality: {only_integer: true}
end
