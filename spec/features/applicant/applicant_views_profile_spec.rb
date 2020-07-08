require 'rails_helper'

feature 'Applicant profile' do
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
    
    visit root_path
    click_on 'Área do Candidato'
    click_on 'Meu Perfil'
    
    expect(page).to have_content('Marie Curie Perfil')
    expect(page).to have_content('Marie Skłodowska Curie')
    expect(page).to have_content('07/11/1867')
    expect(page).to have_content('Doutora em Ciências')
    expect(page).to have_content('Pesquisas pioneiras no ramo da radiotividade' )
    expect(page).to have_content('Polônia')
    expect(page).to have_css('img[src*="mulher.jpeg"]')
  end
end
