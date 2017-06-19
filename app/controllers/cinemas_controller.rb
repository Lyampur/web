class CinemasController < ApplicationController
  before_action :set_cinema, only: [:show, :edit, :update, :destroy]

  # GET /cinemas
  # GET /cinemas.json
  def index
    @cinemas = Cinema.all
    @movies = Movie.all
  end

  # GET /cinemas/1
  # GET /cinemas/1.json
  def show
  end

  # GET /cinemas/new
  def new
    @cinema = Cinema.new
    @movie = Movie.all
  end

  # GET /cinemas/1/edit
  def edit
    @movie = Movie.all
  end

  # POST /cinemas
  # POST /cinemas.json
  def create
    @cinema = Cinema.new(cinema_params)
    @movies = []
    params[:cinema][:movies].each{|a| @movies << Movie.find(a) if a.present?}
    respond_to do |format|
      if @cinema.save
        @movies.each{|a| a.cinemas << @cinema}
        format.html { redirect_to @cinema, notice: t('helpers.forms.cinema') + ' ' + t('helpers.notice.create') }
        format.json { render :show, status: :created, location: @cinema }
      else
        format.html { render :new }
        format.json { render json: @cinema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cinemas/1
  # PATCH/PUT /cinemas/1.json
  def update
    @movies = []
    params[:cinema][:movies].each{|a| @movies << Movie.find(a) if a.present?}
    respond_to do |format|
      if @cinema.update(cinema_params)
        @movies.each{|a| a.cinemas << @cinema}
        format.html { redirect_to @cinema, notice: t('helpers.forms.cinema') + ' ' + t('helpers.notice.update') }
        format.json { render :show, status: :ok, location: @cinema }
      else
        format.html { render :edit }
        format.json { render json: @cinema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cinemas/1
  # DELETE /cinemas/1.json
  def destroy
    @cinema.destroy
    respond_to do |format|
      format.html { redirect_to cinemas_url, notice: t('helpers.forms.cinema') + ' ' + t('helpers.notice.destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cinema
      @cinema = Cinema.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cinema_params
      params.require(:cinema).permit(:name, :address)
    end
end
