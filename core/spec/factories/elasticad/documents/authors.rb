# encoding: utf-8

FactoryGirl.define do
  factory :author_document, class: Elasticad::Documents::Author do
    ip '127.0.0.1'

    after :build do |author|
      author.build_address
      author.build_user
    end

    after :create do |author|
      author.create_address
      author.create_user
    end
  end

  factory :author_without_embedded, class: Elasticad::Documents::Author do
    ip '127.0.0.1'
  end
end
