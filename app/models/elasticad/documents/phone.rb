# encoding: utf-8

class Elasticad::Documents::Phone
  include Mongoid::Document

  # fields
  field :phone, type: String
  field :type,  type: Symbol, default: :mobile

  # relations
  embedded_in :address

  # validations
  validates :phone, presence: true, length: { within: 7..20 }
  validates :type,  presence: true, inclusion: { in: [:work, :home, :mobile] }
end