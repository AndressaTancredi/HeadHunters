require 'rails_helper'

feature 'Admin views job' do
  scenario 'must be signed in' do
    j = Job.create!(title: 'SRE', description: 'Profissional com mais de 5 anos de experiência',skills: 'Linux e Docker', salary: 10000, application_deadline: '15/08/2021', location: 'São Paulo', level: 'Pleno')

    j2 = Job.create!(title: 'Dev Ruby')

    Headhunteruser.create!(email: 'headhunter@test.com.br', password: '12345678')
    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    click_on 'Vagas Cadastradas'
    click_on 'SRE'
    click_on 'Editar'
    fill_in 'Título', with: 'Devops'
    fill_in 'Salário', with: 12000
    fill_in 'Localização', with: 'Santos'
    click_on 'Enviar'

    expect(current_path).to eq job_path(j.id)
    expect(page).to have_content('Devops')
    expect(page).to have_content('Profissional com mais de 5 anos de experiência')
    expect(page).to have_content('Linux e Docker')
    expect(page).to have_content('R$ 12.000,00')
    expect(page).to have_content('15/08/2021')
    expect(page).to have_content('Santos')
    expect(page).not_to have_content(j2)
  end
end