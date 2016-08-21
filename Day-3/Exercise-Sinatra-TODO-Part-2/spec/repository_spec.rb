RSpec.describe 'Repository test' do
    let(:repository) { Repository.new({}) }

    it 'return a Repository' do
        expect(repository).to be_an_instance_of Repository
    end

    it 'load a Repository' do
        expect(repository.load).to be_empty
    end

    it 'save an element in Repository' do
        repository.save ['task']
        expect(repository.load).not_to be_empty
    end
end