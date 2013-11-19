# encoding: utf-8

class Elasticad::Documents::Geo
  include Mongoid::Document

  # fields
  field :latitude,  type: Float, default: 0
  field :longitude, type: Float, default: 0

  # relations
  embedded_in :address, class_name: 'Elasticad::Address'

  # validations
  validates :latitude,  numericality: { greater_than_or_equal_to: 0 }
  validates :longitude, numericality: { greater_than_or_equal_to: 0 }
end