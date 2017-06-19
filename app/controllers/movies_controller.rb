class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def search
    if params.has_key?(:search)
      @movies = Movie.search(search_params)
      render 'search_result' and return
    else
      @movies = []
    end
  end

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
    @staffs = Staff.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    @staff = Staff.all
  end

  # GET /movies/1/edit
  def edit
    @staff = Staff.all
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)
    @staffs = []
    params[:movie][:staffs].each{|a| @staffs << Staff.find(a) if a.present?}

    respond_to do |format|
      if @movie.save
        @staffs.each{|a| a.movies << @movie}
        format.html { redirect_to @movie, notice: t('helpers.forms.movie') + ' ' + t('helpers.notice.create') }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    @staffs = []
    params[:movie][:staffs].each{|a| @staffs << Staff.find(a) if a.present?}
    respond_to do |format|
      if @movie.update(movie_params)
        @staffs.each{|a| a.movies << @movie}
        format.html { redirect_to @movie, notice: t('helpers.forms.movie') + ' ' + t('helpers.notice.update') }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: t('helpers.forms.movie') + ' ' + t('helpers.notice.destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def search_params
      params.require(:search).permit(
        movie:       Movie.attributes_names.map(&:to_sym),
        staff:       Staff.attributes_names.map(&:to_sym),
        movie_staff: MovieStaff.attributes_names.map(&:to_sym),
        cinema:      Cinema.attributes_names.map(&:to_sym)
      )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:name, :genre, :duration, :country, :company, :age_rating,
      movie_staffs_attributes: [:id, :_destroy, :role,
      staff_attributes: [:last_name, :first_name, :birthday] ])
    end
end
