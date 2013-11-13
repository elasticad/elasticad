# encoding: utf-8

class Elasticad::Address
  include Mongoid::Document
  include Mongoid::Timestamps

  # fields
  field :addresses, type: Array,  default: []
  field :type,      type: Symbol, default: :personal
  field :company,   type: String
  field :websites,  type: Array,  default: []


  # relations
  embeds_one :name,         class_name: 'Elasticad::Documents::Name'
  embeds_one :availability, class_name: 'Elasticad::Documents::Availability'
  embeds_one :coordinate,   class_name: 'Elasticad::Documents::Geo'
  
  embeds_many :phones, class_name: 'Elasticad::Documents::Phone'
  embeds_many :emails, class_name: 'Elasticad::Documents::Email'

  belongs_to :city,       class_name: 'Elasticad::City'
  belongs_to :city_area,  class_name: 'Elasticad::CityArea'

  # nested attributes
  accepts_nested_attributes_for(:name)
  accepts_nested_attributes_for(:availability)
  accepts_nested_attributes_for(:coordinate)

  # validations
  validates :type, presence: true

  validates :emails, presence: true

  validates :phones, presence: true
end
