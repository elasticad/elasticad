# encoding: utf-8

class Elasticad::Documents::Attachment
  include Mongoid::Document
  # include Mongoid::Timestamps

  # fields
  field :width,         type: Integer, default: 0
  field :height,        type: Integer, default: 0
  field :file_size,     type: Integer, default: 0
  field :content_type,  type: String
  field :file_name,     type: String

  # relations
  embedded_in :asset, class_name: 'Elasticad::Asset'

  # validations
  validates :width, presence: true, 
                    numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 10000 }

  validates :height, presence: true,
                     numericality: { only_integer: true,
                                     greater_than_or_equal_to: 0,
                                     less_than_or_equal_to: 10000 }

  validates :file_size, presence: true,
                        numericality: { only_integer: true,
                                        greater_than_or_equal_to: 0 }

  validates :content_type, presence: true,
                           inclusion: { in: MIME::Types[/^image/] } 

  validates :file_name, presence: true
end