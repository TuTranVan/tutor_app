class Post < ApplicationRecord
  belongs_to :tutor, optional: true
  belongs_to :student, optional: true
  belongs_to :subject
  has_many :reports, dependent: :destroy
  has_many :schedules, dependent: :destroy

  validates :level, presence: true
  validates :title, presence: true
  validates :from_date, presence: true
  validates :fee, presence: true, numericality: {only_float: true}

  enum status: {open: 0, waiting: 1,starting: 2, finished: 3}

  scope :newest, ->{order created_at: :desc}
  scope :findTutor, ->{where(brand: "Trò Tìm Gia Sư")}
  scope :findStudent, ->{where(brand: "Gia Sư Tìm Trò")}

  def ofTutor?
    brand == "Gia Sư Tìm Trò"
  end

  def address
    if ofTutor?
      tutor.address
    else
      student.address
    end
  end
end
