require 'rails_helper'

feature 'Admin edits job' do
  scenario 'successfuly' do
    job1 = create(:job, title: 'SRE')
    job2 = create(:job, title: 'Dev Ruby')
    headhunteruser = create(:headhunteruser, email: 'headhunter@test.com.br')
    login_as(headhunteruser, scope: :headhunteruser)

    visit root_path
    click_on 'Vagas Cadastradas'
    click_on 'SRE'
    click_on 'Editar'
    fill_in 'Título', with: 'Devops'
    fill_in 'Salário', with: 12000
    fill_in 'Localização', with: 'Santos'
    click_on 'Enviar'

    expect(current_path).to eq job_path(job1.id)
    expect(page).to have_content('Devops')
    expect(page).to have_content('Profissional com mais de 5 anos de experiência')
    expect(page).to have_content('Linux e Docker')
    expect(page).to have_content('R$ 12.000,00')
    expect(page).to have_content('15/08/2021')
    expect(page).to have_content('Santos')
    expect(page).not_to have_content(job2)
  end
end
