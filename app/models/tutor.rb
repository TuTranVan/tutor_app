class Tutor < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  belongs_to :user
  has_many :certificates, dependent: :destroy
  has_many :majors, dependent: :destroy
  has_many :subjects, through: :majors
  has_many :reviews, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :gender, presence: true
  validates :dob, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :literacy, presence: true
  validates :avatar, presence: true

  scope :newest, ->{order created_at: :desc}

  def rating
    total_times = reviews.count
    total_score = reviews.sum(:score)
    if total_times > 0
      (total_score/total_times).to_i
    else
      0
    end
  end

  def ofMajor?(id)
    majors.each do |major|
      if major.subject.id == id.to_i
        return true
      end
    end
    return false
  end
end
