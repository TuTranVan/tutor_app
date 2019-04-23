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
end
