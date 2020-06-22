require 'rails_helper'

feature 'User log in' do
  scenario 'successfuly' do
    Headhunteruser.create!(email: 'headhunter@test.com.br', password: '12345678')

    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    # TODO arrumar i18n na Senha
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content('Signed in successfully')
    #expect(page).to have_link('Cadastrar Vagas')
    #expect(page).to have_link('Ver Vagas Cadastradas')

  end
  
end