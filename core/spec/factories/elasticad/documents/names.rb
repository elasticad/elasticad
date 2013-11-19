# encoding: utf-8

FactoryGirl.define do
  factory :name, class: Elasticad::Documents::Name do
    first_name  'Super'
    middle_name 'Iron'
    last_name   'Man'
  end
end
