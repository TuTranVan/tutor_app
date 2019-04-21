class Report < ApplicationRecord
  belongs_to :post

  validates :study_date, presence: true
  validates :content, presence: true

  scope :newest, ->{order created_at: :desc}
end
