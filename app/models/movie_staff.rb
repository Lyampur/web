class MovieStaff < ActiveRecord::Base
  belongs_to :movie
  belongs_to :staff
 
  validates :movie, uniqueness: {scope: :staff, message: "Already assigned" }
end
