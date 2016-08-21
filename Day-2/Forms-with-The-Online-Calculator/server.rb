require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'lib/calculator'

get '/' do
  erb :welcome
end

post '/result' do
  first_number, operation, second_number = params[:first_number], params[:operation], params[:second_number]
  @result = (Calculator.public_send operation, first_number, second_number if Calculator.methods.include? operation.to_sym) || 0
  erb :result
end

get '/operation/?:last?' do
  @last = params[:last]
  erb :operation
end