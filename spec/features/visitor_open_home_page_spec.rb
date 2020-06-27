require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('HeadHunters')
    expect(page).to have_content('Bem vindo ao sistema de gestão de empregos')
  end
end
