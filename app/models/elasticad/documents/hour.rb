# encoding: utf-8

class Elasticad::Documents::Hour
  include Mongoid::Document

  # fields
  field :from,  type: String, default: '00:00'
  field :to,    type: String, default: '24:00'

  # relations
  embedded_in :availability, class_name: 'Elasticad::Documents::Availability'

  # validations
  # validates :from, :to, format: 
end
