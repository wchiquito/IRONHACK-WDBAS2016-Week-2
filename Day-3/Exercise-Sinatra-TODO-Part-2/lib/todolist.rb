require_relative 'repository'

class TodoList
    attr_reader :tasks

    def initialize
        @tasks = []
    end

    def parse_id id
        id.to_i
    end

    def repository repository
        @repository = repository
    end

    def add_task task
        @tasks.push task
    end

    def complete_task id
        id = parse_id id
        task_index = find_task_by_id id.to_i
        @tasks[task_index].complete! if !task_index.nil?
    end

    def count_tasks
        @tasks.length
    end

    def load_tasks
        @tasks = @repository.load
    end

    def save_tasks
       @repository.save @tasks
    end

    def delete_task id
        id = parse_id id
        task_index = find_task_by_id id
        @tasks.delete_at task_index if !task_index.nil?
    end

    def find_task_by_id id
        id = parse_id id
        @tasks.find_index do |task|
            task.id == id
        end
    end
end