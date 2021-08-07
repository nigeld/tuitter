class Tweet < ApplicationRecord
  belongs_to :user

  validates :text, presence: true, length: 1..280
  validates :user, presence: true

end
