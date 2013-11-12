# encoding: utf-8

class Elasticad::Documents::Price
  include Mongoid::Document

  field :amount,      type: Float, default: 0
  field :currency_id, type: String

  embedded_in :ad

  validates :amount, presence: true
  validates :currency_id, presence: true
end
