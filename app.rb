require 'sinatra'
require 'better_errors'
require './lib/resultado.rb'

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

post '/resultado' do
  jugador1 = params["j1"]
  jugador2 = params["j2"]
  session["resultado"] = "#{jugador1}-#{jugador2}"
  resultado = Resultado.new
  session["random"] = resultado.generarRandom
  session["ganador"] = resultado.verResultado jugador1, jugador2
  #session["contador"] = Resultado.new
  erb :resultado
end