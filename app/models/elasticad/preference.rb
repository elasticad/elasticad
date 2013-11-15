# encoding: utf-8

class Elasticad::Preference
  include Mongoid::Document

  # fields
  field :value,       type: String
  field :key,         type: String
  field :value_type,  type: String

  # validations  
  validates :value, presence: true,
                    length: { within: 1..255 }
  validates :key,   presence: true

  validates :value_type, presence: true,
                         length: { within: 1..255 }
end