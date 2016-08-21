class Task
   attr_reader :id, :content

    def initialize content
        @id = self.__id__
        @content = paser_content content
        @completed = false
        @created_at = Time.now
        @updated_at = nil
    end

    def paser_content content
        content = 'Default...' if content.empty?
        content
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
        @content = paser_content content
        @updated_at = Time.now
    end
end