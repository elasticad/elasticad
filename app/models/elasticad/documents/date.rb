# encoding: utf-8

class Elasticad::Documents::Date
  include Mongoid::Document

  field :published_at, type: DateTime
  field :modified_at, type: DateTime
  field :expire_at, type: DateTime
  field :deleted_at, type: DateTime

  embedded_in :ad
end
