# encoding: utf-8

FactoryGirl.define do
  factory :city, class: 'Elasticad::City' do
    name    'Khujand'
    zipcode '735700'
    state   :active
  end
end
