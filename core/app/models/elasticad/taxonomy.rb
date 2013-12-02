# encoding: utf-8

require 'spec_helper'

class Elasticad::Taxonomy
  include Mongoid::Document
  include Mongoid::Timestamps

  # fields
  field :parent_id,   type: BSON::ObjectId, default: nil
  field :position,    type: Integer,        default: 0
  field :name,        type: String
  field :description, type: String
  field :lft,         type: Integer,        default: 0
  field :rgt,         type: Integer,        default: 0
  field :depth,       type: Integer,        default: 0
  field :state,       type: Symbol,         default: :inactive

  # relations
  embeds_one :icon, class_name: 'Elasticad::Documents::Icon'
  embeds_one :seo,  class_name: 'Elasticad::Documents::Seo'

  # nested attributes
  accepts_nested_attributes_for :icon
  accepts_nested_attributes_for :seo

  # validations
  validates :name,        presence: true, length: { within: 3..255 }
  validates :description, # presence: true, 
                          length: { within: 3..500 }

  validates :position, :lft, :rgt, :depth, numericality: { only_integer: true, 
                                                           greater_than_or_equal_to: 0 }

  STATES = %w(inactive active)

  validates :state, inclusion: { in: [*STATES, *STATES.map(&:to_sym)] }

  # before_create :set_premalink
  # after_initialize { |document| document.build_seo }

  alias_method :old_state, :state

  def state
    old_state.to_s.inquiry
  end

  alias_method :old_icon, :icon

  def icon
    old_icon.nil? ? default_icon : old_icon
  end

  # Creates permalink based on Stringex's .to_url method
  # def set_permalink
  #   if parent.present?
  #     self.seo.permalink = [parent.seo.permalink, (seo.permalink.blank? ? name.to_url : seo.permalink.split('/').last)].join('/')
  #   else
  #     self.seo.permalink = name.to_url if seo.permalink.blank?
  #   end
  # end

  private
    def default_icon

    end
end