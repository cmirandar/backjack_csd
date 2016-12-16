require 'sinatra'
require 'better_errors'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

enable :sessions
set :session_secret, 'thisIsAKleerSecret'

get '/' do
	erb :index
end

get '/comenzar' do
    erb :solicitudCartas
end

get '/solicitarCarta' do
    session["cartaGenerada"] = 6
    erb :solicitudCartas
end