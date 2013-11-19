# encoding: utf-8

FactoryGirl.define do
  factory :asset, class: Elasticad::Asset do
    position  0
    type      'image'
    alt       'Super image'
  end
end