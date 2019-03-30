class Post < ApplicationRecord
  belongs_to :tutor
  belongs_to :student
  belongs_to :subject
  has_many :reports, dependent: :destroy
  has_many :schedules, dependent: :destroy

  validates :type, presence: true
  validates :level, presence: true
  validates :title, presence: true
  validates :fee, presence: true, numericality: {only_integer: true}

  enum status: {open: 0, approved: 1, waiting: 2 ,starting: 3, finished: 4}
end
