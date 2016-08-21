RSpec.describe 'Search' do
    let(:movie0) { Movie.new '0079945',
                            'Star Trek - La película (1979)',
                            nil,
                            '7 December 1979 (USA)'
                  }
    let(:movie1) { Movie.new '0060028',
                            'La conquista del espacio (1966) (TV Series)',
                            '',
                            '8 September 1966 (USA)'
                  }
    let(:movie2) { Movie.new '0796366',
                            'Star Trek (2009)',
                            'http://poster.jpg',
                            '8 May 2009 (USA)'
                  }
    let(:movie3) { Movie.new '0079945',
                            'Star Trek - La película (1979)',
                            'http://poster.jpg',
                            '7 December 1979 (USA)'
                  }
    let(:search) { Search.new }

    it 'valid zero elements to seacrh' do
        search.repository = []
        expect((search.movies 2).length).to eq 0
    end

    it 'show movies that have a poster' do
        search.repository = [movie0, movie1, movie2, movie2]
        expect((search.movies 2).length).to eq 2
    end

    it 'less 2 results' do
        search.repository = [movie2]
        expect((search.movies 2).length).to eq 1
    end

    it 'if poster is nil return zero elements' do
        search.repository = [movie0]
        expect((search.movies 1).length).to eq 0
    end
end