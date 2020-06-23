module LoginMethods 
  def headhunter_login(user)
    visit root_path
    click_on 'Acesso HeadHunter'
    fill_in 'Email', with: 'headhunter@test.com.br'
    fill_in 'Senha', with: '12345678'
    click_on 'Log in'
  end
end
# Dar include LoginMethods nos arquivos de testes.
