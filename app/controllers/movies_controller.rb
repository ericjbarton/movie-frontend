class MoviesController < ApplicationController
end

def index
  movies = Movie.all
  render json: movies
end

def create
  movie = Movie.new(
    user_id: current_user.id,
    title: params[:title],
    year: params[:year],
    director: params[:director],
  )
  if movie.save
    render json: movie
  else
    render json: { errors: movie.errors.full_messages }, status: :bad_request
  end
end

def show
  movie = Movie.find_by(id: params[:id])
  render json: movie
end

def update
  movie = Movie.find_by(id: params[:id])
  movie.title = params[:title] || movie.title
  movie.year = params[:year] || movie.year
  movie.director = params[:director] || movie.director
  if movie.save
    render json: movie
  else
    render json: { errors: movie.errors.full_messages }, status: :bad_request
  end

  def destroy
    movie = Movie.find_by(id: params[:id])
    movie.destroy
    render json: { message: "movie successfully destroyed!" }
  end
end
