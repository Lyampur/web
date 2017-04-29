class Cinema < ActiveRecord::Base
  has_and_belongs_to_many :movies
  validates :name, :address, presence: true
end
