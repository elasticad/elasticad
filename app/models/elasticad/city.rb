# encoding: utf-8

class Elasticad::City
  include Mongoid::Document

  # fields
  field :name,    type: String
  field :zipcode, type: String
  field :state,   type: Symbol, default: :inactive

  # relations
  belongs_to :region
  has_many :city_areas
  
  # validations
  validates :name, presence: true,
                   length: { within: 3..40 }
                   
  validates :state, inclusion: { in: [:active, :inactive] }
end