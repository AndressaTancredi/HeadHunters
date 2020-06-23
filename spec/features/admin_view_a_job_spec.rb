require 'rails_helper'

include LoginMethods

feature 'Admin view a job' do
  scenario 'must be signed in' do
    Headhunteruser.create!(email: 'headhunter@test.com.br', password: '12345678')

    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content('Login efetuado com sucesso!')
  end

  scenario 'successfully' do
    Job.create!(title: 'SRE', description: 'Profissional com mais de 5 anos de experiência',skills: 'Linux e Docker', salary: 10000, application_deadline: '15/08/2020', location: 'São Paulo', level: 'Pleno')

    Headhunteruser.create!(email: 'headhunter@test.com.br', password: '12345678')
    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    
    click_on 'Vagas Cadastradas'

    expect(page).to have_content('SRE')
  end

  scenario 'and view details' do
    Job.create!(title: 'SRE', description: 'Profissional com mais de 5 anos de experiência',skills: 'Linux e Docker', salary: 10000, application_deadline: '15/08/2020', location: 'São Paulo', level: 'Pleno')

    Headhunteruser.create!(email: 'headhunter@test.com.br', password: '12345678')
    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
  
    visit root_path
    click_on 'Vagas Cadastradas'
    click_on 'SRE'

    expect(page).to have_content('SRE')
    expect(page).to have_content('Profissional com mais de 5 anos de experiência')
    expect(page).to have_content('Linux e Docker')
    expect(page).to have_content('R$ 10.000,00')
    expect(page).to have_content('15/08/2020')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('Pleno')
    expect(page).to have_link('Voltar')
  end

end
