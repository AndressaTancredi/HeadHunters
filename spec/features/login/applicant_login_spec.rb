require 'rails_helper'

feature 'Applicant log in' do
  scenario 'successfuly' do
    create(:applicantuser, email:'applicant@test.com.br')

    visit root_path
    click_on 'Acesso Candidato'
    fill_in 'Email', with: 'applicant@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content('Login efetuado com sucesso!')
    expect(page).to have_link('Logout')
    expect(page).not_to have_link('Acesso Candidato')
  end

  scenario 'and logout' do
    create(:applicantuser, email:'applicant@test.com.br')

    visit root_path
    click_on 'Acesso Candidato'
    fill_in 'Email', with: 'applicant@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
    click_on 'Logout'

    expect(page).to have_content('Saiu com sucesso')
    expect(page).not_to have_link('Logout')
    expect(page).to have_link('Acesso Candidato')
  end
end
