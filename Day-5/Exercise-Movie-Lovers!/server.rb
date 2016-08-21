require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'lib/search'
require_relative 'lib/repository'

get '/' do
    erb :search
end

get '/search' do
    @title_movie, @movies_length, @min_movies = '', 0, 3
    erb :movies
end

post '/search' do
    type = params[:type]
    title_movie = params[:title_movie]
    is_search = (type == 'search')
    search = Search.new
    @title_movie = title_movie if is_search 
    @title_movie = search.random_title_movie unless is_search
    search.repository = (Repository.new.search @title_movie if !@title_movie.empty?) || []
    @movies = search.movies 9
    @movies_length, @min_movies = @movies.length, 3
    erb :movies
end