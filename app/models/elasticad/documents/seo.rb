# encoding: utf-8

class Elasticad::Documents::Seo
  include Mongoid::Document

  field :permalink, type: String

  embeds_one :meta
  embedded_in :ad

  accepts_nested_attributes_for :meta

  validates :permalink, presence: true,
                        uniqueness: true
end
