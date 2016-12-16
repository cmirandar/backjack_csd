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
    session["cartaGeneradaJugador"] = ''
    session["cartaGeneradaPC"] = ''
    erb :solicitudCartas
end

get '/solicitarCarta' do
    valor = params["valor"]
    random = Random.rand(13)
    
    
    if valor == '1' 
       session["acumuladoJugador"] = random + session["acumuladoJugador"]
       session["cartaGeneradaJugador"] = random.to_s + "+" + session["cartaGeneradaJugador"]
   else
        numeroJugadas = 3
        i = 0
        while i < numeroJugadas  do
            session["acumuladoPC"] = random + session["acumuladoPC"]
            session["cartaGeneradaPC"] = random.to_s + "+" + session["cartaGeneradaPC"]
           i +=1
        end
        
   end
    
    
    erb :solicitudCartas
end

post '/resultado' do
  jugador1 = session["acumuladoJugador"] #params["j1"]
  jugador2 = session["acumuladoPC"] #params["j2"]
  session["resultado"] = "#{jugador1}-#{jugador2}"
  resultado = Resultado.new
  session["random"] = resultado.generarRandom
  session["ganador"] = resultado.verResultado jugador1, jugador2
  #session["contador"] = Resultado.new
  erb :resultado
end