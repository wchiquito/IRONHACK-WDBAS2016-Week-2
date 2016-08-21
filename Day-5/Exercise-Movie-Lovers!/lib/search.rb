require_relative 'repository'
require_relative 'movie'

class Search
    attr_writer :repository

    def repository repository
        @repository = repository
    end

    def movies number
        @movies = filter_by_poster @repository, number
    end

    def filter_by_poster all_movies, number
        movies_with_poster = []
        all_movies.each do |movie|
            next if poster? movie.poster
            movies_with_poster.push new_movie movie.id,
                                              movie.title,
                                              movie.poster,
                                              movie.release_date
            break if movies_with_poster.length == number
        end
        movies_with_poster
    end

    def new_movie id, title, poster, release_date
        Movie.new id,
                  title,
                  poster,
                  release_date
    end
    
    def poster? poster
        poster.nil? || poster.empty?
    end

    def random_title_movie
        repository = Repository.new.search_top250
        random_movies = repository.shuffle!
        title = random_movies[rand(0..random_movies.length - 1)].title
        title.split("\n")[1].strip
    end
end