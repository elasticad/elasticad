# encoding: utf-8

FactoryGirl.define do
  factory :seo_document, class: 'Elasticad::Documents::Seo' do
    permalink 'awesome-elasticad'

    after :build do |seo|
      seo.build_meta_data(attributes_for(:metadata_document))
    end

    after :create do |seo|
      seo.create_meta_data(attributes_for(:metadata_document))
    end
  end
end
