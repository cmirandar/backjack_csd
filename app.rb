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
    session["acumuladoJugador"]  = 0
    session["acumuladoPC"]  = 0
    erb :solicitudCartas
end

get '/solicitarCarta' do
    valor = params["valor"]
    random = Random.rand(21)
    
    if valor == '1' 
        session["acumuladoJugador"] = random + session["acumuladoJugador"]
        session["cartaGeneradaJugador"] = random
    else
        session["acumuladoPC"] = random + session["acumuladoPC"]
        session["cartaGeneradaPC"] = random
    end
    
    
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