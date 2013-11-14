# encoding: utf-8

FactoryGirl.define do
  factory :city_area, class: 'Elasticad::CityArea' do
    name  'Brooklyn'
    state :active
  end
end