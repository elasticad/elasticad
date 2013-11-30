# encoding: utf-8

class Elasticad::Documents::Icon
  include Mongoid::Document

  # fields
  field :file_name,     type: String
  field :content_type,  type: String,   default: 'image/png'
  field :file_size,     type: Integer,  default: 0

  # relations
  embedded_in :taxonomy, class_name: 'Elasticad::Taxonomy'

  # validations
  validates :file_name, presence: true 
  validates :file_size, presence: true, 
                        numericality: { only_integer: true, 
                                        greater_than_or_equal_to: 0 }

  validates :content_type, inclusion: { in: MIME::Types[/^image/] }
end