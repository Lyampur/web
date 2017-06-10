class CinemaMoviesController < ApplicationController
  before_action :set_cinema_movie, only: [:show, :edit, :update, :destroy]

  # GET /cinema_movies
  # GET /cinema_movies.json
  def index
    @cinema_movies = CinemaMovie.all
  end

  # GET /cinema_movies/1
  # GET /cinema_movies/1.json
  def show
  end

  # GET /cinema_movies/new
  def new
    @cinema_movie = CinemaMovie.new
  end

  # GET /cinema_movies/1/edit
  def edit
  end

  # POST /cinema_movies
  # POST /cinema_movies.json
  def create
    @cinema_movie = CinemaMovie.new(cinema_movie_params)

    respond_to do |format|
      if @cinema_movie.save
        format.html { redirect_to @cinema_movie, notice: 'Cinema movie was successfully created.' }
        format.json { render :show, status: :created, location: @cinema_movie }
      else
        format.html { render :new }
        format.json { render json: @cinema_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cinema_movies/1
  # PATCH/PUT /cinema_movies/1.json
  def update
    respond_to do |format|
      if @cinema_movie.update(cinema_movie_params)
        format.html { redirect_to @cinema_movie, notice: 'Cinema movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @cinema_movie }
      else
        format.html { render :edit }
        format.json { render json: @cinema_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cinema_movies/1
  # DELETE /cinema_movies/1.json
  def destroy
    @cinema_movie.destroy
    respond_to do |format|
      format.html { redirect_to cinema_movies_url, notice: 'Cinema movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cinema_movie
      @cinema_movie = CinemaMovie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cinema_movie_params
      params.require(:cinema_movie).permit(:cinema_id, :movie_id)
    end
end
