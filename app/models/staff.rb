class Staff < ActiveRecord::Base
  has_many :movie_staffs, dependent: :destroy
  has_many :movies, through: :movie_staffs
  validates :last_name, :first_name, :birthday, presence: true
  validates :last_name, uniqueness: {scope: [:first_name, :birthday]}

  def self.attributes_names
    self.new.attributes.keys - ['created_at', 'updated_at']
  end
end
