class User < ApplicationRecord
  before_save :downcase_email

  has_one :tutor, dependent: :destroy
  has_one :student, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 150},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  validates :name, presence: true
  validates :role, presence: true

  enum role: {admin: 1, tutor: 2, student: 3}

  has_secure_password

  private

  def downcase_email
    self.email = email.downcase
  end
end
