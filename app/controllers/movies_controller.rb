class MoviesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @movies = current_user.movies
    respond_to do |format|
      format.html 
      format.json { render json: @movie }
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = current_user.movies.build(movie_params)
    respond_to do |format|
      if @movie.save
        if params[:images]
          params[:images].each { |image|
            @movie.pictures.create(image: image)
          }
        end
        format.html { redirect_to @movie, notice: 'Movie successfully created.' }
          format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
     @movie  = Movie.find(params[:id])
     @pictures = @movie.pictures

     respond_to do |format|
       format.html # show.html.erb
       format.json { render json: @movie }
     end
   end

   def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(movie_params)
        if params[:images]

          params[:images].each { |image|
            @movie.pictures.create(image: image)
          }
        end
        format.html { redirect_to @movie, notice: 'Movie is successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     @movie = Movie.find(params[:id])
     @movie.destroy

     respond_to do |format|
       format.html { redirect_to movies_url }
       format.json { head :no_content }
     end
   end

  private

  def movie_params
    params.require(:movie).permit(:title, :summary, :pictures)
  end

end
