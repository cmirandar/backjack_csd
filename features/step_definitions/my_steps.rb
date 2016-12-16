
Given(/^que abro la aplicacion$/) do
  visit '/'
end

Then(/^debo ver "([^"]*)"$/) do |titulo|
   expect(page.body).to match /#{titulo}/m
end

Given(/^que comienzo el juego$/) do
  click_button("btnComenzar")
end

Given(/^que "([^"]*)" solicite una carta$/) do |jugador|
      visit '/'
    expect(page.body).to match /BlackJack/m
    click_button("btnComenzar")
end

Then(/^se acumula el puntaje del "([^"]*)"$/) do |jugador|
  click_button("btnSolicitarCartaJugador")
end
    

Given(/^que da click en Ver resultado$/) do
    visit '/'
end

When(/^defino a "([^"]*)" y "([^"]*)" como resultado$/) do |jugador1, jugador2|

end

When(/^termina el juego$/) do
    click_button("resultado")
end

Given(/^que Jugador detenga su jugada$/) do
          visit '/'
    expect(page.body).to match /BlackJack/m
    click_button("btnComenzar")
  click_button("btnPararJugada")
end