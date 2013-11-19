# encoding: utf-8

class Elasticad::Documents::Name
  include Mongoid::Document

  # fields
  field :first_name , type: String, default: ''
  field :middle_name, type: String, default: ''
  field :last_name,   type: String, default: ''

  # relations
  embedded_in :address

  # validations
  validates :first_name,  presence: true,
                          length: { within: 3..20 }
  validates :last_name,   presence: true,
                          length: { within: 3..20 }
  validates :middle_name, length: { within: 3..20 }                          
end