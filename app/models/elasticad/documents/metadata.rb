# encoding: utf-8

class Elasticad::Documents::Metadata
  include Mongoid::Document

  field :description, type: String
  field :title,       type: String
  field :keywords,    type: Array,  default: []

  embedded_in :seo

  validates :description, presence: true
  validates :title,       presence: true
end