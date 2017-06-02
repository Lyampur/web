class Movie < ActiveRecord::Base
  has_many :movie_staffs
  has_many :cinema_movies
  has_many :staffs, through: :movie_staffs
  has_many :cinemas, through: :cinema_movies
  validates :name, :genre, :duration, :country, :company, :age_rating, presence: true
  validates :genre, length: {in: 0..20}

  def self.search(params)
    result = Movie
    if params['name'].present?
      result = result.where(name: params['name'])
    end
    if params['genre'].present?
      result = result.where(genre: params['genre'])
    end
    result.all
  end
end
