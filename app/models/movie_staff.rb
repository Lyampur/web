class MovieStaff < ActiveRecord::Base
  belongs_to :movie
  belongs_to :staff

  accepts_nested_attributes_for :staff, allow_destroy: true

  validates :movie_id, uniqueness: {scope: :staff_id, message: "Already assigned" }

  def self.attributes_names
    self.new.attributes.keys - ['created_at', 'updated_at']
  end
end
