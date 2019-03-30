class Comment < ApplicationRecord
  belongs_to :tutor
  belongs_to :student

  validates :content, presence: true
end
