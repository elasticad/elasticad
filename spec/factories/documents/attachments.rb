# encoding: utf-8

FactoryGirl.define do
  factory :attachment_document, class: 'Elasticad::Documents::Attachment' do
    width         240
    height        240
    file_size     40000
    content_type  'image/png'
    file_name     'my-image.png'
  end
end