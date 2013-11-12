# encoding: utf-8

class Elasticad::Documents::State
  include Mongoid::Document

  field :premium, type: Boolean, default: false
  field :enabled, type: Boolean, default: false
  field :active,  type: Boolean, default: false
  field :spam,    type: Boolean, default: false

  embedded_in :ad
end