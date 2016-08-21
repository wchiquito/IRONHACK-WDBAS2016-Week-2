class Repository
    def initialize repository
        @repository = repository
    end

    def load
        repository = @repository[:tasks]
        repository = [] if repository.nil?
        repository
    end

    def save tasks
        @repository[:tasks] = tasks
    end
end