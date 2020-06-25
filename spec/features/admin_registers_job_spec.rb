require 'rails_helper'

feature 'Admin registers job' do
  scenario 'successfuly' do
    # Teste para create não se cria antes algo no BD. Pq pode ter um falso positivo lendo o que já tem no BD.

    Headhunteruser.create!(email: 'headhunter@test.com.br', password: '12345678')
    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    
    visit root_path
    click_on 'Cadastrar Nova Vaga'

    fill_in 'Título', with: 'Desenvolvedor Java'
    fill_in 'Descrição', with: 'Desenvolver código Java'
    fill_in 'Nível', with: 'Senior'
    fill_in 'Habilidades', with: 'Java e SpringBoot'
    fill_in 'Salário', with: 15000
    fill_in 'Data Final Para Aplicação', with: '10/08/2021'
    fill_in 'Localização', with: 'São Paulo'
    click_on 'Cadastrar'

    expect(page).to have_content('Desenvolvedor Java')
    expect(page).to have_content('Desenvolver código Java')
    expect(page).to have_content('Senior')
    expect(page).to have_content('Java e SpringBoot')
    expect(page).to have_content('R$ 15.000,00')
    expect(page).to have_content('10/08/2021')
    expect(page).to have_content('São Paulo')
  end

  scenario 'and title cannot be blanck' do
    Headhunteruser.create!(email: 'headhunter@test.com.br', password: '12345678')
    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    visit root_path
    click_on 'Cadastrar Nova Vaga'

    fill_in 'Título', with: ''

    click_on 'Cadastrar'

    expect(Job.count).to eq 0
  end
end