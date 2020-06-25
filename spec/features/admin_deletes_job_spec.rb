require 'rails_helper'

feature 'Admin deletes job' do
  scenario 'successfully' do

    Job.create!(title: 'SRE', description: 'Profissional com mais de 5 anos de experiência',skills: 'Linux e Docker', salary: 10000, application_deadline: '15/08/2021', location: 'São Paulo', level: 'Pleno')
    
    Headhunteruser.create!(email: 'headhunter@test.com.br', password: '12345678')
    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    click_on 'Vagas Cadastradas'
    click_on 'SRE'
    click_on 'Apagar'

    expect(current_path).to eq jobs_path
    expect(page).to have_content('Nenhuma vaga cadastrada')
  end

  scenario 'and keep anothers' do
    Job.create!(title: 'SRE', description: 'Profissional com mais de 5 anos de experiência',skills: 'Linux e Docker', salary: 10000, application_deadline: '15/08/2021', location: 'São Paulo', level: 'Pleno')
    Job.create!(title: 'Dev Ruby', description: 'Profissional com mais de 5 anos de experiência',skills: 'Linux e Docker', salary: 10000, application_deadline: '15/08/2021', location: 'São Paulo', level: 'Pleno')

    Headhunteruser.create!(email: 'headhunter@test.com.br', password: '12345678')
    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    click_on 'Vagas Cadastradas'
    click_on 'Dev Ruby'
    click_on 'Apagar'

    expect(current_path).to eq jobs_path
    expect(page).not_to have_content('Dev Ruby')
    expect(page).to have_content('SRE')
  end
end
