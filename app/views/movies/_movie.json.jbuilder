json.extract! movie, :id, :name, :genre, :duration, :country, :company, :age_rating, :created_at, :updated_at
json.url movie_url(movie, format: :json)
