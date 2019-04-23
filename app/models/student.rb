class Student < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :gender, presence: true
  validates :dob, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :literacy, presence: true

  scope :newest, ->{order created_at: :desc}

  def review tutor
    review = self.reviews.find_by tutor_id: tutor.id
  end
end
