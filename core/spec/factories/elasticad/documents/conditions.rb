# encoding: utf-8

FactoryGirl.define do
  factory :condition_document, class: Elasticad::Documents::Condition do
    label       :new
    percentage  100
  end
end
