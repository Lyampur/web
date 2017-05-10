class Cinema < ActiveRecord::Base
  has_many :cinema_movies
  has_many :movies, through: :cinema_movies
  validates :name, :address, presence: true
end
