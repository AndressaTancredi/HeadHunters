FactoryBot.define do
  factory :job do
    sequence(:title) { |n| "#{n}" }
    description { 'Profissional com mais de 5 anos de experiência' }
    skills { 'Linux e Docker' }
    salary { 10000 }
    application_deadline { '15/08/2021' }
    location { 'São Paulo' }
    level { 'Pleno' }
  end
end