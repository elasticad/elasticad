# encoding: utf-8

FactoryGirl.define do
  factory :region, class: Elasticad::Region do
    name  'Sugd'
    state :active
  end
end