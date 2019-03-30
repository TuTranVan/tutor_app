class Schedule < ApplicationRecord
  belongs_to :post

  validates :day, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
