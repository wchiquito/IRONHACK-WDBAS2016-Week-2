require 'sinatra'
require 'sinatra/reloader' if development?

enable :sessions

get '/' do
    redirect to '/about'
end

get '/hi' do
    'From Sinatra'
    session[:save_value] = (['a', 'b', 'c', 'd'].shuffle!).join
end

get '/about' do
    @show = true
    @time = Time.now.strftime('%Y-%m-%d @ %H:%M:%S')
    @repos = ['Repo One', 'Repo Two', 'Repo Three']
    erb :about
end

get '/repos/:repo' do
    @time = Time.now.strftime('%Y-%m-%d @ %H:%M:%S')
    @repos = ['Repo One', 'Repo Two', 'Repo Three']
    repo_int = params[:repo].to_i
    if repo_int < 1 || repo_int > @repos.length
        @repo = 'Not exist repo...'
    else
        @repo = @repos[repo_int - 1]
    end 
    erb :repo
end