# encoding: utf-8

class Elasticad::Documents::Condition
  include Mongoid::Document

  field :percentage,  type: Integer,  default: 0
  field :label,       type: String,   default: :old

  validates :percentage,  presence: true
  validates :label,       presence: true


  embedded_in :ad
end