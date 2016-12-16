class Resultado
 
    
    
    def verResultado j1, j2
         if j1>21&&j2>21
             return "Ambos pasaron 21! No hay ganador"
         elsif j1>j2
            if j1>21
                return "Gana PC"
            else
                return "Gana Jugador"  
            end
         elsif j2>j1
            if j2>21
                return "Gana Jugador"
            else
                return "Gana PC"  
            end
        elsif j2=j1
            return "EMPATE" 
        end
    end
    
    def generarRandom
        
        random1 = Random.rand(21)
        random2 = Random.rand(21)
         if random1>random2
            ganador = "Gana Jugador"
         else
            ganador  = "Gana PC"
        end
        return random1.to_s + "-" + random2.to_s + "  "+ ganador
    end
    
end