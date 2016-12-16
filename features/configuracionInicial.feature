Feature:
    Como cesar (jugador)
    Quiero poder selecionar los jugadores
    Para definir que jugadores participaran en la pelea

Scenario: Debe tener el titulo "Mortal Kombat"
  Given que abro la applicacion
  Then debo ver "Mortal Kombat"
  
Scenario: Debo poder configurar los nombres jugadorA y jugadorB
  Given que abro la applicacion
  When defino a "LIU KAM" y "LIU KAM" como jugadores
  And inicio una partida
  Then debo ver "LIU KAM vs LIU KAM"
  
Scenario: Debo poder configurar los nombres jugadorA y jugadorB
  Given que abro la applicacion
  When defino a "RAY" y "SUBZERO" como jugadores
  And inicio una partida
  Then debo ver "RAY vs SUBZERO"