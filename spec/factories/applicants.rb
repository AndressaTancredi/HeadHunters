include ActionDispatch::TestProcess

FactoryBot.define do
  factory :applicant do
    sequence(:name) { |n| "#{n}" }
    sequence(:social_name) { |n| "#{n}" }
    birthdate { '07/11/1867' }
    education { 'Doutora em Ciências' }
    description { 'Pesquisas pioneiras no ramo da radiotividade' }
    location { 'Polônia' }
    avatar { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'mulher.jpeg'), 'image/jpeg') }  end
end