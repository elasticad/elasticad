# encoding: utf-8

class Elasticad::Asset
  include Mongoid::Document
  include Mongoid::Timestamps

  # fields
  field :position,  type: Integer, default: 0
  field :type,      type: String
  field :alt,       type: String

  # relations
  embeds_one :attachment, class_name: 'Elasticad::Documents::Attachment'
  
  # nested attributes
  accepts_nested_attributes_for :attachment

  # validation
  validates :position, numericality: { only_integer: true,
                                       greater_than_or_equal_to: 0 }
end