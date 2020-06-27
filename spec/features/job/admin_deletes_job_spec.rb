require 'rails_helper'

feature 'Admin deletes job' do
  scenario 'successfully' do
    create(:job, title: 'SRE')
    headhunteruser = create(:headhunteruser, email: 'headhunter@test.com.br')
    login_as(headhunteruser, scope: :headhunteruser)

    visit root_path
    click_on 'Vagas Cadastradas'
    click_on 'SRE'
    click_on 'Apagar'

    expect(current_path).to eq jobs_path
    expect(page).to have_content('Nenhuma vaga cadastrada')
  end

  scenario 'and keep anothers' do
    create(:job, title: 'SRE')
    create(:job, title: 'Dev Ruby')
    headhunteruser = create(:headhunteruser, email: 'headhunter@test.com.br')
    login_as(headhunteruser, scope: :headhunteruser)

    visit root_path
    click_on 'Vagas Cadastradas'
    click_on 'Dev Ruby'
    click_on 'Apagar'

    expect(current_path).to eq jobs_path
    expect(page).not_to have_content('Dev Ruby')
    expect(page).to have_content('SRE')
  end
end
