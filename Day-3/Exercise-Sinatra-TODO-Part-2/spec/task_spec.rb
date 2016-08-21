RSpec.describe 'Task test' do
    let(:task) { Task.new('Walk the dog') }

    it 'return the task completed or not' do
        expect(task.completed?).to eq false
    end

    it 'change the task complete to true' do
        expect(task.complete!).to eq true
    end

    it 'takes a completed task and makes it\'s status false' do
        expect(task.make_incomplete!).to eq false
    end

    it 'update the task\'s text' do
        task.update_content! 'Buy the milk'
        expect(task.content).to eq 'Buy the milk'
    end

    it 'if new content is empty, return Default' do
        task = Task.new('')
        expect(task.content).to eq 'Default...'
    end

    it 'if update content is empty, return Default' do
        task.update_content! ''
        expect(task.content).to eq 'Default...'
    end
end