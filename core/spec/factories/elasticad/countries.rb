# encoding: utf-8

FactoryGirl.define do
  factory :country, class: Elasticad::Country do
    name            'Tajikistan'
    numcode         0
    states_required false
    state           :active
  end
end