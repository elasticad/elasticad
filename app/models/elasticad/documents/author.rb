# encoding: utf-8

class Elasticad::Documents::Author
  include Mongoid::Document

  field :ip, type: String

  embedded_in :ad

  validates :ip, presence: true
end