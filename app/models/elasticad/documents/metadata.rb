# encoding: utf-8

class Elasticad::Documents::Metadata
  include Mongoid::Document

  field :description, type: String
  field :title,       type: String
  field :keywords,    type: Array,  default: []

  embedded_in :seo, class_name: 'Elasticad::Documents::Seo'

  validates :description, presence: true
  validates :title,       presence: true
  validates :keywords,    presence: true
end
