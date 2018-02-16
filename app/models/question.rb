class Question < ApplicationRecord
  has_many :comments
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }

  def vote_of(user)
    Vote.where(submission_id: self.id, submission_type: :question, user: user).first
  end
end
