# encoding: utf-8

FactoryGirl.define do
  factory :availability_document,
          class: Elasticad::Documents::Availability do
    days [0, 1, 2, 3, 4, 5, 6]

  end
end
