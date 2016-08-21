require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'lib/passwordchecker'

get '/' do
    erb :login
end

post '/validate' do
    email, password = params[:email], params[:password]
    passwordchecker = PasswordChecker.new
    is_secure = passwordchecker.check_password email, password
    redirect 'congratulations' if is_secure
    redirect '/'
end

get '/congratulations' do
    erb :congratulations
end