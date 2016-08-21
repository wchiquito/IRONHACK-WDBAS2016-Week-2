require 'imdb'

class Repository
    def search text
        (Imdb::Search.new text).movies
    end

    def search_top250
        Imdb::Top250.new.movies
    end
end