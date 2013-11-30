# encoding: utf-8

FactoryGirl.define do
  factory :icon, class: Elasticad::Documents::Icon do
    file_name 'icon.png'  
    file_size 10000
  end
end