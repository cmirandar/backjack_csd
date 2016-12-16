Feature:
    Como cesar (jugador)
    Quiero poder ver el puntaje final
    Para saber quien gano el juego de blackjack
  
Scenario: Debo poder ver el resultado de los jugadorA y jugadorB
  Given que da click en Ver resultado
  When defino a "21" y "18" como resultado
  And termina el juego
  Then debo ver "21-18"
  
  Scenario: Debo poder ver el resultado de los jugadorA y jugadorB
  Given que da click en Ver resultado
  When defino a "18" y "21" como resultado
  And termina el juego
  Then debo ver "18-21"