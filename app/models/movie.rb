class Movie < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :summary, presence: true
end
