class MovieStaff < ActiveRecord::Base
  belongs_to :movie
  belongs_to :staff

  accepts_nested_attributes_for :staff, allow_destroy: true

  validates :movie, uniqueness: {scope: :staff, message: "Already assigned" }
end
