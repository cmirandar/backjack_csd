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
    session["cartaComodin"] = '' 
    session["usasteComodin"] = 0 
    erb :solicitudCartas
end

get '/solicitarCarta' do
    valor = params["valor"]
    if valor == '1' 
        random = Random.rand(13)
       if random + session["acumuladoJugador"] > 21  && session["usasteComodin"] == 0
            session["cartaComodin"] = "Usaste tu carta comodin...Carta igual a" + random.to_s 
            session["usasteComodin"] = 1 
       else
           session["acumuladoJugador"] = random + session["acumuladoJugador"]
           session["cartaGeneradaJugador"] = random.to_s + "+" + session["cartaGeneradaJugador"]
        end
   else
        numeroJugadas = 2
        i = 0
        while i < numeroJugadas  do
            random = Random.rand(13)
            session["acumuladoPC"] = random + session["acumuladoPC"]
            session["cartaGeneradaPC"] = random.to_s + "+" + session["cartaGeneradaPC"]
           i +=1
           if session["acumuladoPC"] > 21 
                break;
            else
                if i == session["acumuladoPC"] - 1 and session["acumuladoPC"] < 21 and session["acumuladoPC"] < session["acumuladoJugador"]
                    numeroJugadas +=1
                end
            end
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