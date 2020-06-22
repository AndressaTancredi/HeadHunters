require 'rails_helper'

feature 'User log in' do
  scenario 'successfuly' do
    Headhunteruser.create!(email: 'headhunter@test.com.br', password: '12345678')

    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content('Login efetuado com sucesso!')
    #expect(page).to have_link('Cadastrar Vagas')
    #expect(page).to have_link('Ver Vagas Cadastradas')
    expect(page).to have_link('Logout')
    expect(page).not_to have_link('Acesso HeadHunter')
  end

  scenario 'and log out' do
    Headhunteruser.create!(email: 'headhunter@test.com.br', password: '12345678')

    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Logout'

    expect(page).to have_content('Saiu com sucesso')
    expect(page).not_to have_link('Logout')
    expect(page).to have_link('Acesso HeadHunter')
    #expect(page).not_to have_link('Cadastrar Vagas')
    #expect(page).not_to have_link('Ver Vagas Cadastradas')

    # TODO colocar ir da index na application para aparecer em todas as paginas
  end
end