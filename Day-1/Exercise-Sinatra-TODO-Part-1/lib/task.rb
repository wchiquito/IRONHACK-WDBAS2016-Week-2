class Task
   attr_reader :id, :content

    def initialize content
        @id = self.__id__
        @content = content
        @completed = false
        @created_at = Time.now
        @updated_at = nil
    end

    def complete!
        @completed = true
    end

    def completed?
        @completed
    end

    def make_incomplete!
        @completed = !complete!
    end

    def update_content! content
        @content = content
        @updated_at = Time.now
    end
end