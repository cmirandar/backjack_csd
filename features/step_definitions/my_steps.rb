
Given(/^que abro la aplicacion$/) do
  visit '/'
end

Then(/^debo ver "([^"]*)"$/) do |titulo|
   expect(page.body).to match /#{titulo}/m
end

Given(/^que comienzo el juego$/) do
  click_button("btnComenzar")
end

Given(/^que el jugador solicite una carta$/) do
      visit '/'
    expect(page.body).to match /BlackJack/m
    click_button("btnComenzar")
    click_button("btnSolicitarCarta")
end

Then(/^debe aparecer "([^"]*)" : "([^"]*)"$/) do |label, numeroCarta|
          visit '/'
    expect(page.body).to match /BlackJack/m
    click_button("btnComenzar")
    click_button("btnSolicitarCarta")
  expect(page.body).to match /#{label} : #{numeroCarta}/m
end