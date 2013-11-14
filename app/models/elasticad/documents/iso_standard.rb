# encoding: utf-8

class Elasticad::Documents::IsoStandard
  include Mongoid::Document  

  # fields
  field :iso_name,  type: String
  field :iso,       type: String
  field :iso3,      type: String

  # relations
  embedded_in :country, class_name: 'Elasticad::Country'

  # validations
  validates :iso_name,  presence: true,
                        length: { in: 3..40 },
                        format: { with: /\A[a-z\ \']{3,40}\z/i }

  validates :iso,       presence: true,
                        format: { with: /\A[a-z]{2}\z/i }
  validates :iso3,      presence: true,
                        format: { with: /\A[a-z]{3}\z/i }
end