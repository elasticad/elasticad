# encoding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :documents_email, class: 'Elasticad::Documents::Email' do
    text 'me@example.dev'
    display false
    primary true
  end
end
