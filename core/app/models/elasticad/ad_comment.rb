# encoding: utf-8

class Elasticad::AdComment
  include Mongoid::Document
  include Mongoid::Timestamps

  # fields
  field :title, type: String
  field :body,  type: String
  field :state, type: Symbol, default: :inactive

  # relations
  embeds_one :author, class_name: 'Elasticad::Documents::Author'
  belongs_to :ad,     class_name: 'Elasticad::Ad'


  # validations
  validates :title, presence: true,
                    length: { within: 5..40 }
  
  validates :body, presence: true,
                   length: { within: 10..500 }

  STATES = %w(inactive active enabled disabled spam)

  validates :state, inclusion: { in: [*STATES, *STATES.map(&:to_sym)] }            

  validates :author, presence: true


  alias_method :old_state, :state

  def state
    old_state.to_s.inquiry
  end
end