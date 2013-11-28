# encoding: utf-8

class Elasticad::Region
  include Mongoid::Document
  include Mongoid::Timestamps


  # fields
  field :name,  type: String
  field :state, type: Symbol, default: :inactive

  # relations
  belongs_to :country,  class_name: 'Elasticad::Country'
  has_many :cities,     class_name: 'Elasticad::City'

  # validation
  validates :name,  presence: true,
                    length: { within: 3..40 }

  STATES = %w(inactive active)

  validates :state, inclusion: { in: [*STATES, *STATES.map(&:to_sym)] }

  alias_method :old_state, :state

  def state
    old_state.to_s.inquiry
  end  
end