# encoding: utf-8

FactoryGirl.define do
  factory :metadata_document, class: Elasticad::Documents::Metadata do
    description 'Meta description'
    title       'Meta title'
    keywords    %w(key words)
  end
end
