class Movie < ActiveRecord::Base
  has_many :movie_staffs
  has_many :cinema_movies
  has_many :staffs, through: :movie_staffs
  has_many :cinemas, through: :cinema_movies
  validates :name, :genre, :duration, :country, :company, :age_rating, presence: true
  validates :genre, length: {in: 0..20}
end
