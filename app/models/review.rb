class Review < ApplicationRecord
  belongs_to :tutor
  belongs_to :student

  validates :score, presence: true
  validates :content, presence: true

  scope :newest, ->{order created_at: :desc}
end
