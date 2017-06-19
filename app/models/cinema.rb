class Cinema < ActiveRecord::Base
  has_many :cinema_movies, dependent: :destroy
  has_many :movies, through: :cinema_movies
  validates :name, :address, presence: true


  def self.attributes_names
    self.new.attributes.keys - ['created_at', 'updated_at']
  end
end
