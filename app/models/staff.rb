class Staff < ActiveRecord::Base
  has_many :movie_staffs
  has_many :movies, through: :movie_staffs
  validates :last_name, :first_name, :birthday, presence: true
end
