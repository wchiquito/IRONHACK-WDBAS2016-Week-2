class Movie
    attr_reader :id, :title, :poster, :release_date
    
    def initialize id, title, poster, release_date
        @id = id
        @title = title
        @poster = poster
        @release_date = release_date
    end
end