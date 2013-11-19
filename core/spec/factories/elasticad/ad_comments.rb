# encoding: utf-8

FactoryGirl.define do
  factory :ad_comment, class: Elasticad::AdComment do
    title 'Whats up?'
    body  'What is it????'
    state :active

    factory :created_ad_comment_child do
      after(:build) do |ad_comment|
        ad_comment.build_author(attributes_for(:author_document))
      end
    end
  end
end