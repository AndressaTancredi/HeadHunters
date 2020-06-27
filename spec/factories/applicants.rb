FactoryBot.define do
  factory :applicant do
    sequence(:name) { |n| "#{n}" }
    sequence(:social_name) { |n| "#{n}" }
    birthdate { '07/11/1867' }
    education { 'Dourora em Ciências' }
    description { 'Pesquisas pioneiras no ramo da radiotividade' }
    location { 'Polônia' }
    image { '' }
  end
end