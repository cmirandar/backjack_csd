
Given(/^que abro la aplicacion$/) do
  visit '/'
end

Then(/^debo ver "([^"]*)"$/) do |titulo|
   expect(page.body).to match /#{titulo}/m
end

Given(/^que comienzo el juego$/) do
  click_button("btnComenzar")
end

Given(/^que el "([^"]*)" solicite una carta$/) do |jugador|
      visit '/'
    expect(page.body).to match /BlackJack/m
    click_button("btnComenzar")
    click_button("btnSolicitarCarta#{jugador}")
end



Given(/^que da click en Ver resultado$/) do
    visit '/'
end

When(/^defino a "([^"]*)" y "([^"]*)" como resultado$/) do |jugador1, jugador2|
    fill_in("j1", :with => jugador1) 
    fill_in("j2", :with => jugador2)
end

When(/^termina el juego$/) do
    click_button("resultado")
end