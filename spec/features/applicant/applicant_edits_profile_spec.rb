require 'rails_helper'

feature 'Applicant edits profile' do
  scenario 'successfully' do
    ap1 = create(:applicant, name: 'Marie Skłodowska Curie', social_name: 'Marie Curie')
    ap2 = create(:applicant, name: 'Antônia', social_name: 'Toninha')
    applicantuser = create(:applicantuser, email:'applicant@test.com.br')
    login_as(applicantuser, scope: :applicantuser)
    
    visit root_path
    click_on 'Meu Perfil'
    click_on 'Marie Curie'
    click_on 'Editar'
    fill_in 'Nome Completo', with: 'Alessandra Souza'
    fill_in 'Nome Social', with: 'Alessandra'
    click_on 'Enviar'
    
    expect(current_path).to eq applicant_path(ap1.id)
    expect(page).to have_content('Alessandra Souza')
    expect(page).to have_content('Alessandra')
    expect(page).to have_content('07/11/1867')
    expect(page).to have_content('Doutora em Ciências')
    expect(page).to have_content('Pesquisas pioneiras no ramo da radiotividade' )
    expect(page).to have_content('Polônia')
    #expect(page).to have_content('')
    expect(page).not_to have_content(ap2)
  end
end
