class Movie < ActiveRecord::Base
  has_many :movie_staffs, dependent: :destroy
  has_many :cinema_movies, dependent: :destroy
  has_many :staffs, through: :movie_staffs
  has_many :cinemas, through: :cinema_movies
  validates :name, :genre, :duration, :country, :company, :age_rating, presence: true
  validates :genre, length: {in: 0..20}

  accepts_nested_attributes_for :movie_staffs,
    #  reject_if: proc{ |r| r['first_name'].blank? & r['last_name'].blank? & r['birthday'].blank?},
     allow_destroy: true
  #validates_associated :movie_staffs

  def self.search(params)
    query = Movie.eager_load(:cinemas, :staffs, :movie_staffs)
    params.each do |entity, hsh|
      hsh.each do |atr, val|
        next if val.nil? || val.to_s.blank?
        query = query.where( entity.pluralize.to_sym => {atr => val} )
      end
    end
    return query
  end

  def self.attributes_names
    self.new.attributes.keys - ['created_at', 'updated_at']
  end
end
