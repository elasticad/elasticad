# encoding: utf-8

FactoryGirl.define do
  factory :iso_standard_document, class: Elasticad::Documents::IsoStandard do
    iso_name  'Chad'
    iso       'TD'
    iso3      'TCD'
  end
end