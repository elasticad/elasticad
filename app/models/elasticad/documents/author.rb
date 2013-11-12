# encoding: utf-8

class Elasticad::Documents::Author
  include Mongoid::Document

  field :ip, type: String

  embedded_in :ad
  belongs_to :user
  belongs_to :address

  validates :ip, presence: true
  validates_formatting_of :ip, using: :ip_address_v4
end
