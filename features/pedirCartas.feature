Feature:
    Como un jugador de Cartas
    Quiero solicitar mas cartas a mi jugada
    Para llegar a 21 y ganar

Scenario: Debe tener el titulo "BlackJack"
  Given que abro la aplicacion
  Then debo ver "BlackJack"
  
Scenario: debe tener la opcion "Comenzar Juego"
  Given que abro la aplicacion
  Then debo ver "Comenzar Juego" 
  
Scenario: debo poder tener la opcion "Solicitar Cartas"
  Given que abro la aplicacion
  And que comienzo el juego  
  Then debo ver "Solicitar Cartas"
  
Scenario: debo mostrar la "Carta Solicitada"
  Given que el jugador solicite una carta
  Then debe aparecer "Carta Solicitada" : "6"