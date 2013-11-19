# encoding: utf-8
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email_document, class: Elasticad::Documents::Email do
    email   'me@example.dev'
    display false
    primary true
  end
end
