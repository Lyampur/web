class CinemaMovie < ActiveRecord::Base
  belongs_to :cinema
  belongs_to :movie

  validates :cinema, uniqueness: {scope: :movie, message: "Эта кинотеатр и фильм уже связаны" }
end
