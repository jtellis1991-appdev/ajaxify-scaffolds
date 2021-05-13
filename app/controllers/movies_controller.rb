class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    @movies = Movie.all
    @movie = Movie.new
  end

  # GET /movies/1 or /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit_duration
    @movie = Movie.find(params[:id]) 
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit_year
    @movie = Movie.find(params[:id]) 
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit_director
    @movie = Movie.find(params[:id]) 
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit_description
    @movie = Movie.find(params[:id]) 
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit_title
    @movie = Movie.find(params[:id]) 
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)
    @movie.id = Movie.last.id + 1
    @movie.title = !@movie.title.empty? ? @movie.title : "Add title"
    @movie.duration = !@movie.duration.nil? ? @movie.duration : 0
    @movie.year = !@movie.year.nil? ? @movie.year : 0
    @movie.description = !@movie.description.empty? ? @movie.description : "Add description"

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    old_movie = Movie.find(params[:id])
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
        if old_movie.description != @movie.description
          format.js { render template: "movies/update_description.js.erb"}
        elsif old_movie.title  != @movie.title 
          format.js { render template: "movies/update_title.js.erb"}
        elsif old_movie.director  != @movie.director 
          format.js { render template: "movies/update_director.js.erb"}
        elsif old_movie.year  != @movie.year 
          format.js { render template: "movies/update_year.js.erb"}
        elsif old_movie.duration  != @movie.duration 
          format.js { render template: "movies/update_duration.js.erb"}
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :description, :duration, :image, :year, :director_id)
    end
end
