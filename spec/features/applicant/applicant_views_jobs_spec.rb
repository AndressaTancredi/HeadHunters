require 'rails_helper'

feature 'Applicant views jobs' do
  scenario 'must be signed in' do
    create(:applicantuser, email:'applicant@test.com.br')

    visit root_path
    click_on 'Acesso Candidato'
    fill_in 'Email', with: 'applicant@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content('Login efetuado com sucesso!')
  end

  scenario 'successfully' do
    applicantuser = create(:applicantuser, email:'applicant@test.com.br')
    login_as(applicantuser, scope: :applicantuser)
    create(:applicant, name: 'Marie Skłodowska Curie', social_name: 'Marie Curie', applicantuser: applicantuser)
    headhunteruser = create(:headhunteruser, email: 'headhunter@test.com.br')
    create(:job, title: 'SRE', headhunteruser: headhunteruser)

    visit root_path
    click_on 'Área do Candidato'
    click_on 'Ver Vagas'
    click_on 'SRE'

    expect(page).to have_content('SRE')
    expect(page).to have_content('Profissional com mais de 5 anos de experiência')
    expect(page).to have_content('Linux e Docker')
    expect(page).to have_content('R$ 10.000,00')
    expect(page).to have_content('15/08/2021')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('Pleno')
    expect(page).to have_link('Voltar')
  end

  scenario 'and do not have any job registered' do
    applicantuser = create(:applicantuser, email:'applicant@test.com.br')
    login_as(applicantuser, scope: :applicantuser)
    create(:applicant, name: 'Marie Skłodowska Curie', social_name: 'Marie Curie', applicantuser: applicantuser)

    visit root_path
    click_on 'Área do Candidato'
    click_on 'Ver Vagas'

    expect(page).to have_content('Nenhuma vaga cadastrada')
  end
end