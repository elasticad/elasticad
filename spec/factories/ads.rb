# encoding: utf-8

FactoryGirl.define do
  factory :ad, class: 'Elasticad::Ad' do
    title       "Ad's title"
    description "Ad's description"
    type        :for_sale

    after :create do |ad|
      ad.prices.create(attributes_for(:price_document))
      ad.create_seo(attributes_for(:seo_document))
      ad.create_state(attributes_for(:state_document))
      ad.create_condition(attributes_for(:condition_document))
      ad.create_author(attributes_for(:author_document))
    end

    after :build do |ad|
      ad.prices.build(attributes_for(:price_document))
      ad.build_seo(attributes_for(:seo_document))
      ad.build_state(attributes_for(:state_document))
      ad.build_condition(attributes_for(:condition_document))
      ad.build_author(attributes_for(:author_document))
    end    
  end

  factory :ad_without_embedded, class: 'Elasticad::Ad' do
    title       "Ad's title"
    description "Ad's description"
    type        :for_sale
  end
end
