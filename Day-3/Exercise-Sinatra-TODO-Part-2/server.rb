require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'lib/task'
require_relative 'lib/todolist'
require_relative 'lib/repository'

enable :sessions

get '/' do
    redirect to '/tasks'
end

get '/tasks' do
    @tasks = init_todolist session
    erb :task_index
end

get '/task_new' do
    erb :task_new
end

post '/task_create' do
    todolist = init_todolist session, true
    todolist.add_task Task.new(params[:task_text])
    end_todolist todolist
    redirect to '/tasks'
end

get '/complete_task/:id' do
    todolist = init_todolist session, true
    todolist.complete_task params[:id]
    end_todolist todolist
    redirect to '/tasks'
end

get '/delete_task/:id' do
    todolist = init_todolist session, true
    todolist.delete_task params[:id]
    end_todolist todolist
    redirect to '/tasks'
end

def init_todolist session, load = false
    todolist = TodoList.new
    repository = Repository.new session
    todolist.repository repository
    todolist.load_tasks
    return todolist.tasks if !load
    todolist
end

def end_todolist todolist
    todolist.save_tasks
end