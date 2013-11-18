# encoding: utf-8

FactoryGirl.define do
  factory :state, class: 'Elasticad::State' do
    name  'Michigan'
    abbr  'MI'
    state :active
  end
end
