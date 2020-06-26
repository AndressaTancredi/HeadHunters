require 'rails_helper'

feature 'Headhunter log in' do
  scenario 'successfuly' do
    Headhunteruser.create!(email: 'headhunter@test.com.br', password: '12345678')

    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content('Login efetuado com sucesso!')
    expect(page).to have_link('Cadastrar Nova Vaga')
    expect(page).to have_link('Vagas Cadastradas')
    expect(page).to have_link('Logout')
    expect(page).not_to have_link('Acesso HeadHunter')
  end

  scenario 'and logout' do
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
    expect(page).not_to have_link('Cadastrar Nova Vaga')
    expect(page).not_to have_link('Vagas Cadastradas')

  end
end