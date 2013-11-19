# encoding: utf-8

FactoryGirl.define do
  factory :price_document, class: Elasticad::Documents::Price do
    amount        100
    currency_code 'USD'
  end
end
