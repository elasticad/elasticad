# encoding: utf-8

class Elasticad::Ad
  include Mongoid::Document
  include Mongoid::Timestamps

  # TODO: describe briefly about the purpose of these fields

  # fields
  # field :taxon_id,          type: BSON::ObjectId, default: 0
  # field :taxon_id,          type: Integer,        default: 0
  field :title,             type: String
  field :description,       type: String
  field :type,              type: String
  field :placement_period,  type: Integer,        default: 0
  # field :prices,            type: Array,          default: []
  field :activation_hash,   type: String

  # relations
  embeds_many :prices

  embeds_one :date
  embeds_one :author
  embeds_one :condition
  embeds_one :state
  embeds_one :seo

  belongs_to :taxon
  
  # nested attributes
  accepts_nested_attributes_for(:date)
  accepts_nested_attributes_for(:author)
  accepts_nested_attributes_for(:condition)
  accepts_nested_attributes_for(:state)
  accepts_nested_attributes_for(:seo)

  # validations
  validates :title, presence: true
  validates :description, presence: true
  validates :type, presence: true
end
