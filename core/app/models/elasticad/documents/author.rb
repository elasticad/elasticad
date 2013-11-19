# encoding: utf-8

class Elasticad::Documents::Author
  include Mongoid::Document

  field :ip, type: String

  embedded_in :ad,      class_name: 'Elasticad::Ad'
  belongs_to :user,     class_name: 'Elasticad::User'
  belongs_to :address,  class_name: 'Elasticad::Address'

  validates :ip, presence: true
  validates_formatting_of :ip, using: :ip_address_v4
end
