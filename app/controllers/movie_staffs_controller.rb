class MovieStaffsController < ApplicationController
  before_action :set_movie_staff, only: [:show, :edit, :update, :destroy]

  # GET /movie_staffs
  # GET /movie_staffs.json
  def index
    @movie_staffs = MovieStaff.all
  end

  # GET /movie_staffs/1
  # GET /movie_staffs/1.json
  def show
  end

  # GET /movie_staffs/new
  def new
    @movie_staff = MovieStaff.new
  end

  # GET /movie_staffs/1/edit
  def edit
  end

  # POST /movie_staffs
  # POST /movie_staffs.json
  def create
    @movie_staff = MovieStaff.new(movie_staff_params)

    respond_to do |format|
      if @movie_staff.save
        format.html { redirect_to @movie_staff, notice: 'Movie staff was successfully created.' }
        format.json { render :show, status: :created, location: @movie_staff }
      else
        format.html { render :new }
        format.json { render json: @movie_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie_staffs/1
  # PATCH/PUT /movie_staffs/1.json
  def update
    respond_to do |format|
      if @movie_staff.update(movie_staff_params)
        format.html { redirect_to @movie_staff, notice: 'Movie staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie_staff }
      else
        format.html { render :edit }
        format.json { render json: @movie_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_staffs/1
  # DELETE /movie_staffs/1.json
  def destroy
    @movie_staff.destroy
    respond_to do |format|
      format.html { redirect_to movie_staffs_url, notice: 'Movie staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_staff
      @movie_staff = MovieStaff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_staff_params
      params.require(:movie_staff).permit(:movie_id, :staff_id)
    end
end
