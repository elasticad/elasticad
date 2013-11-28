# encoding: utf-8

class Elasticad::City
  include Mongoid::Document
  include Mongoid::Timestamps
  
  # fields
  field :name,    type: String
  field :zipcode, type: String
  field :state,   type: Symbol, default: :inactive

  # relations
  belongs_to :region
  has_many :city_areas
  
  # validations
  validates :name, presence: true,
                   length: { within: 3..40 }

  STATES = %w(inactive active)

  validates :state, inclusion: { in: [*STATES, *STATES.map(&:to_sym)] }



  alias_method :old_state, :state

  def state
    old_state.to_s.inquiry
  end  
end