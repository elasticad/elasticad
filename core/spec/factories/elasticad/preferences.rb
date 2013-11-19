# encoding: utf-8

FactoryGirl.define do
  factory :preference, class: Elasticad::Preference do
    value       'site_name'  
    key         'Awesome site'
    value_type  'String'
  end
end