# encoding: utf-8

class Elasticad::Documents::Availability
  include Mongoid::Document

  # fields
  field :days, type: Array, default: []

  # relations
  embedded_in :address, class_name: 'Elasticad::Address'
  embeds_many :hours,   class_name: 'Elasticad::Documents::Hour'

  # validation
  # validates :days, numericality: { only_integer: true,
  #                                  greater_than_or_equal_to: 0,
  #                                  less_than_or_equal_to: 7 }
  # validates :days, inclusion: { in: 0..7 }

end
