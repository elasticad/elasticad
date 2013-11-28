# encoding: utf-8

class Elasticad::State
  include Mongoid::Document
  include Mongoid::Timestamps
  
  # fields
  field :name,  type: String
  field :abbr,  type: String
  field :state, type: Symbol, default: :inactive

  # relations
  belongs_to :country

  # validations
  validates :name, presence: true,
                   length: { within: 3..40 }

  validates :abbr, presence: true,
                   format: { with: /\A[a-z]{2}\z/i }

  STATES = %w(inactive active)

  validates :state, inclusion: { in: [*STATES, *STATES.map(&:to_sym)] }

  alias_method :old_state, :state

  def state
    old_state.to_s.inquiry
  end  
end