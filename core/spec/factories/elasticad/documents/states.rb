# encoding: utf-8

FactoryGirl.define do
  factory :state_document, class: Elasticad::Documents::State do
    premium false
    enabled true
    active  true
    spam    false
  end
end
