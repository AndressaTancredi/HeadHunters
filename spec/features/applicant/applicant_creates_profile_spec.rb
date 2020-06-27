require 'rails_helper'

feature 'Applicant profile' do
  scenario 'sees the profile page' do
    applicantuser = create(:applicantuser, email:'applicant@test.com.br')
    login_as(applicantuser, scope: :applicantuser)

    visit root_path
    click_on 'Meu Perfil'

    expect(page).to have_content('Perfil do Candidato')
    expect(page).to have_content('Perfil não cadastrado')
    expect(page).to have_link('Gerenciar Perfil')
  end

  scenario 'creates profile' do
    create(:applicant, name: 'Marie Skłodowska Curie', social_name: 'Marie Curie')
    applicantuser = create(:applicantuser, email:'applicant@test.com.br')
    login_as(applicantuser, scope: :applicantuser)
    
    visit root_path
    click_on 'Meu Perfil'
    click_on 'Gerenciar Perfil'
    fill_in 'Nome Completo', with: 'Marie Skłodowska Curie'
    fill_in 'Nome Social', with: 'Marie Curie'
    fill_in 'Data de Nascimento', with: '07/11/1867'
    fill_in 'Formação', with: 'Doutora em Ciências'
    fill_in 'Descrição', with: 'Pesquisas pioneiras no ramo da radioatividade.'
    fill_in 'Localização', with: 'Polônia'
    #page.attach_file("Foto de Perfil", Rails.root + 'app/assets/images/mc.jpeg') 
    #attach_file 'Foto de perfil', Rails.root.join('app/assets/images/mc.jpeg')
    click_on 'Enviar'

    expect(page).to have_content('Marie Skłodowska Curie')
    expect(page).to have_content('07/11/1867')
    expect(page).to have_content('Doutora em Ciências')
    expect(page).to have_content('Pesquisas pioneiras no ramo da radioatividade')
    expect(page).to have_content('Polônia')
    #expect(page).to have_content('')
  end
end
