# encoding: utf-8

class Elasticad::Documents::Icon
  include Mongoid::Document
  include Paperclip::Glue

  # fields
  field :icon_file_name,      type: String
  field :icon_content_type,   type: String,   default: 'image/png'
  field :icon_file_size,      type: Integer,  default: 0
  field :icon_updated_at,     type: DateTime

  # relations
  embedded_in :taxonomy, class_name: 'Elasticad::Taxonomy'

  # validations
  # validates :icon_file_name, presence: true 
  # validates :icon_file_size, presence: true, 
  #                            numericality: { only_integer: true, 
  #                                            greater_than_or_equal_to: 0 }

  # validates :icon_content_type, inclusion: { in: MIME::Types[/^image/] }

  # validates_attachment :icon, presence: false,
  #                             content_type: { content_type: 'image/jpg' },
  #                             size: { in: 0..2.megabytes }

  has_attached_file :icon,
    styles: { mini: '32x32>', normal: '128x128>' },
    default_style: :mini,
    url: '/elasticad/taxons/:id/:style/:basename.:extension',
    path: ':rails_root/public/elasticad/taxons/:id/:style/:basename.:extension',
    default_url: '/assets/default_taxon.png'  
end