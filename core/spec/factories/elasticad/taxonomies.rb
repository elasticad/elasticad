# encoding: utf-8

FactoryGirl.define do
  factory :taxonomy, class: Elasticad::Taxonomy do
    name        "Taxonomy's name"
    description "Taxonomy's description"
  end
end