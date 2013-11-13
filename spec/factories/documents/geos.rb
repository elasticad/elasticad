# encoding: utf-8

FactoryGirl.define do
  factory :geo_document, class: 'Elasticad::Documents::Geo' do
    latitude  60.2345
    longitude 20.6433
  end
end
