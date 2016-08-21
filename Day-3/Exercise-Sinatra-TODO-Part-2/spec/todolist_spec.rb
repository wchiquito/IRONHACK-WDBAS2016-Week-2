RSpec.describe 'TodoList test' do
    let (:todolist) { TodoList.new }
    let (:task) { Task.new 'Buy the milk' }

    it 'add tasks to our TodoList' do
        todolist.add_task task
        expect(todolist.count_tasks).to eq 1
    end

    it 'count tasks to our TodoList' do
        (0...3).each { |task| todolist.add_task task }
        expect(todolist.count_tasks).to eq 3
    end

    it 'load tasks from session' do
        repository = Repository.new({ "tasks": [task, task] })
        todolist.repository repository
        todolist.load_tasks
        expect(todolist.count_tasks).to eq 2
    end

    it 'save tasks in session' do
        repository = Repository.new({})
        todolist.repository repository
        todolist.add_task task
        todolist.save_tasks
        expect(todolist.count_tasks).to eq 1
    end

    it 'get task index in Tasks' do
        todolist.add_task task
        task_index = todolist.find_task_by_id task.id
        expect(task_index).to eq 0
    end

    it 'not get task index in Tasks' do
        task_index = todolist.find_task_by_id task.id
        expect(task_index).to be_nil
    end

    it 'delete task in Tasks' do
        todolist.add_task task
        todolist.delete_task task.id
        expect(todolist.count_tasks).to eq 0
    end

    it 'not delete if index not found in Tasks' do
        todolist.add_task task
        todolist.delete_task 0
        expect(todolist.count_tasks).to eq 1
    end
end