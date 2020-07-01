require 'rails_helper'

feature 'Applicant profile' do
  scenario 'creates profile' do
    applicantuser = create(:applicantuser, email:'applicant@test.com.br')
    login_as(applicantuser, scope: :applicantuser)

    visit root_path
    click_on 'Cadastrar Perfil'
    fill_in 'Nome Completo', with: 'Marie Skłodowska Curie'
    fill_in 'Nome Social', with: 'Marie Curie'
    fill_in 'Data de Nascimento', with: '07/11/1867'
    fill_in 'Formação', with: 'Doutora em Ciências'
    fill_in 'Descrição', with: 'Pesquisas pioneiras no ramo da radioatividade.'
    fill_in 'Localização', with: 'Polônia'
    #attach_file 'Foto de perfil', Rails.root.join('/spec/fixtures/mc.jpeg')
    click_on 'Enviar'

    expect(page).to have_content('Marie Skłodowska Curie')
    expect(page).to have_content('07/11/1867')
    expect(page).to have_content('Doutora em Ciências')
    expect(page).to have_content('Pesquisas pioneiras no ramo da radioatividade')
    expect(page).to have_content('Polônia')
    #expect(page).to have_css('img[src*="mc.jpeg"]')carrierWave ou activeStorage
  end
end
