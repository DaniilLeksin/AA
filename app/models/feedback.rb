class Feedback < ApplicationRecord
  validates :url, presence: true
  validates :nickname, presence: true
  validates :text, presence: true

end
