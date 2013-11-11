class Elasticad::Ad
  include Mongoid::Document

  # TODO: describe briefly about the purpose of these fields

  # fields
  field :taxon_id,          type: BSON::ObjectId, default: 0
  # field :taxon_id,          type: Integer, default: 0
  field :title,             type: String
  field :description,       type: String
  field :type,              type: String
  field :placement_period,  type: Integer, default: 0

  # relations
  embeds_one :seo

  # validations
  validates :title, presence: true
  validates :description, presence: true
  validates :type, presence: true
end
