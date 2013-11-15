# encoding: utf-8

class Elasticad::CityArea
  include Mongoid::Document
  include Mongoid::Timestamps
  
  # fields
  field :name,  type: String
  field :state, type: Symbol, default: :inactive

  # relations
  belongs_to :city,       class_name: 'Elasticad::City'
  embeds_one :coordinate, class_name: 'Elasticad::Documents::Geo'

  # validation
  validates :name, presence: true,
                   length: { within: 3..40 }

  validates :state, inclusion: { in: [:inactive, :active] }
end