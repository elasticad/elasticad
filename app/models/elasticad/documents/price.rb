# encoding: utf-8

class Elasticad::Documents::Price
  include Mongoid::Document

  field :amount,        type: Float, default: 0
  field :currency_code, type: String

  embedded_in :ad

  validates :amount,        presence: true,
                            numericality: { greater_than_or_equal_to: 0 }
  validates :currency_code, presence: true,
                            length: { within: 3..5 }
end
