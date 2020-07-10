require 'rails_helper'

feature 'Admin views job' do
  scenario 'must be signed in' do
    create(:headhunteruser, email: 'headhunter@test.com.br')

    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content('Login efetuado com sucesso!')
  end

  scenario 'successfully' do
    headhunteruser = create(:headhunteruser, email: 'headhunter@test.com.br')
    login_as(headhunteruser, scope: :headhunteruser)
    create(:job, title: 'SRE', headhunteruser: headhunteruser)

    visit root_path
    click_on 'Vagas Cadastradas'

    expect(page).to have_content('SRE')
  end

  scenario 'and views details' do
    headhunteruser = create(:headhunteruser, email: 'headhunter@test.com.br')
    login_as(headhunteruser, scope: :headhunteruser)
    create(:job, title: 'SRE', headhunteruser: headhunteruser)

  
    visit root_path
    click_on 'Vagas Cadastradas'
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
end
