# encoding: utf-8

class Elasticad::Documents::Seo
  include Mongoid::Document

  field :permalink, type: String

  embeds_one :meta_data, class_name: 'Elasticad::Documents::Metadata'
  embedded_in :ad, class_name: 'Elasticad::Ad'

  accepts_nested_attributes_for :meta_data

  validates :permalink, presence: true,
                        uniqueness: true
end
