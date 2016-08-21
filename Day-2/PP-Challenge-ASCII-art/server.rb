require 'sinatra'
require 'sinatra/reloader' if development?
require 'artii'

get '/ascii/:word/?:font?/?:secret?' do
    word = params[:word]
    font = params[:font]
    secret = params[:secret]
    redirect to "https://www.google.es/search?q=#{word}&tbm=isch" if font == 'special' && secret == 'secret'
    @artii = Artii::Base.new(:font => (font || 'doh')).asciify word
    erb :word
end