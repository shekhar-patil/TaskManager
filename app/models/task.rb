class Task < ApplicationRecord
  belongs_to :user
  validates  :description, presence: true
  validates  :creator_id, presence: true
end
