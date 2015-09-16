class MoviesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @movies = current_user.movies
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "Movie created successfully"
    else
      render :new
    end
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :summary)
  end

end
