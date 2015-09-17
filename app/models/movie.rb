class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, :dependent => :destroy
  validates :title, presence: true
  validates :summary, presence: true
end
