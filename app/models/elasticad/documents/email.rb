# encoding: utf-8

class Elasticad::Documents::Email
  include Mongoid::Document

  field :text,    type: String
  field :display, type: Boolean, default: false
  field :primary, type: Boolean, default: false

  embedded_in :address, class_name: 'Elasticad::Address'

  validates :text, presence: true # , email: true
  validates :primary, inclusion: { in: [true, false] }
  validates :display, inclusion: { in: [true, false] }

  validates_formatting_of :text, using: :email
end
