# encoding: utf-8

class Elasticad::Documents::Email
  include Mongoid::Document

  field :text,    type: String
  field :display, type: Boolean, default: false
  field :primary, type: Boolean, default: false

  embedded_in :address

  validates :text, presence: true#, email: true
  validates_formatting_of :text, using: :email
end