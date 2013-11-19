# encoding: utf-8

FactoryGirl.define do
  factory :phone_document, class: Elasticad::Documents::Phone do
    phone '(+992) 90-777-77-77'
    type  :mobile
  end
end
