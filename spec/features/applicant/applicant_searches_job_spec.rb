require 'rails_helper'

feature 'Applicant searchs job' do
  scenario 'from title' do
    applicantuser = create(:applicantuser, email:'applicant@test.com.br')
    login_as(applicantuser, scope: :applicantuser)
    create(:applicant, name: 'Marie Skłodowska Curie', social_name: 'Marie Curie', applicantuser: applicantuser)
    headhunteruser = create(:headhunteruser, email: 'headhunter@test.com.br')
    create(:job, title: 'SRE', headhunteruser: headhunteruser)
    create(:job, title: 'QA', headhunteruser: headhunteruser)

    visit root_path
    click_on 'Área do Candidato'
    click_on 'Ver Vagas'
    fill_in 'Busca', with: 'SRE'
    click_on 'Buscar'

    expect(current_path).to eq search_jobs_path
    expect(page).to have_content 'SRE'
    expect(page).not_to have_content 'QA'
  end

  scenario 'from partial title with multiple results' do
    applicantuser = create(:applicantuser, email:'applicant@test.com.br')
    login_as(applicantuser, scope: :applicantuser)
    create(:applicant, name: 'Marie Skłodowska Curie', social_name: 'Marie Curie', applicantuser: applicantuser)
    headhunteruser = create(:headhunteruser, email: 'headhunter@test.com.br')
    create(:job, title: 'Desenvolvedora Ruby', description: 'Ruby On Rails', headhunteruser: headhunteruser)
    create(:job, title: 'Desenvolvedora FrontEnd', description: 'Javascript', headhunteruser: headhunteruser)
    create(:job, title: 'QA', description: 'Faz tudo', headhunteruser: headhunteruser)

    visit root_path
    click_on 'Área do Candidato'
    click_on 'Ver Vagas'
    fill_in 'Busca', with: 'Desenvolvedora'
    click_on 'Buscar'

    expect(current_path).to eq search_jobs_path
    expect(page).to have_content 'Resultado da busca por: Desenvolvedora'
    expect(page).to have_content '2 Vagas Encontradas'
    expect(page).to have_content 'Desenvolvedora Ruby'
    expect(page).to have_content 'Desenvolvedora FrontEnd'
    expect(page).not_to have_content 'QA'
  end

  scenario 'there are not results' do
    applicantuser = create(:applicantuser, email:'applicant@test.com.br')
    login_as(applicantuser, scope: :applicantuser)
    create(:applicant, name: 'Marie Skłodowska Curie', social_name: 'Marie Curie', applicantuser: applicantuser)

    visit root_path
    click_on 'Área do Candidato'
    click_on 'Ver Vagas'
    fill_in 'Busca', with: 'Desenvolvedora'
    click_on 'Buscar'

    expect(current_path).to eq search_jobs_path
    expect(page).to have_content 'Resultado da busca por: Desenvolvedora'
    expect(page).to have_content 'Nenhuma vaga cadastrada'
  end  
end
