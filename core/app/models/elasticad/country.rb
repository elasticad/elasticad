# encoding: utf-8

class Elasticad::Country
  include Mongoid::Document
  include Mongoid::Timestamps

  # fields
  field :name,            type: String
  field :numcode,         type: Integer,  default: 0
  field :states_required, type: Boolean,  default: false
  field :state,           type: Symbol,   default: :inactive

  # relations
  embeds_one :iso_standard, class_name: 'Elasticad::Documents::IsoStandard'

  has_many :regions,  class_name: 'Elasticad::Region' 
  has_many :states,   class_name: 'Elasticad::State'
  
  # nested attributes
  accepts_nested_attributes_for :iso_standard
  
  # validations
  validates :name,    presence: true,
                      uniqueness: true,
                      length: { within: 3..40 }

  validates :numcode, presence: true,
                      uniqueness: true,
                      numericality: { only_integer: true,
                                      greater_than_or_equal_to: 0 }

  validates :states_required, inclusion: { in: [true, false] }

  STATES = %w(inactive active)

  validates :state, inclusion: { in: [*STATES, *STATES.map(&:to_sym)] }

  alias_method :old_state, :state

  def state
    old_state.to_s.inquiry
  end  
end