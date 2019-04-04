class Task < ApplicationRecord
  belongs_to :user, foreign_key: "assignee_id"
  has_many :comments, dependent: :destroy
  
  validates  :description, presence: true
  validates  :creator_id, presence: true
  validates  :assignee_id, presence: true

  enum state: ["open", "in_progress", "done"]
end
