# encoding: utf-8

FactoryGirl.define do
  factory :icon, class: Elasticad::Documents::Icon do
    icon_file_name 'icon.png'  
    icon_file_size 10000
  end
end