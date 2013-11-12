# encoding: utf-8

class Elasticad::Documents::Condition
  include Mongoid::Document

  field :percentage,  type: Integer,  default: 0
  field :label,       type: String,   default: :old

  validates :percentage,  presence: true,
                          numericality: { only_integer: true,
                                          greater_than_or_equal_to: 0,
                                          less_than_or_equal_to: 100 }

  validates :label,       presence: true,
                          inclusion: { in: [:old, :new, :good] }

  embedded_in :ad
end
