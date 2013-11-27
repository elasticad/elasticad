# encoding: utf-8

class Elasticad::Ad
  include Mongoid::Document
  include Mongoid::Timestamps

  # TODO: describe briefly about the purpose of these fields

  # fields
  # field :taxon_id,          type: BSON::ObjectId, default: 0
  # field :taxon_id,          type: Integer,        default: 0
  field :title,             type: String
  field :description,       type: String
  field :type,              type: String
  field :placement_period,  type: Integer,        default: 0
  # field :prices,            type: Array,          default: []
  field :activation_hash,   type: String
  field :state,             type: Symbol,         default: :inactive

  # relations
  embeds_many :prices,    class_name: 'Elasticad::Documents::Price'

  embeds_one :date,       class_name: 'Elasticad::Documents::Date'
  embeds_one :author,     class_name: 'Elasticad::Documents::Author'
  embeds_one :condition,  class_name: 'Elasticad::Documents::Condition'
  embeds_one :seo,        class_name: 'Elasticad::Documents::Seo'

  belongs_to :taxon

  has_many :comments,     class_name: 'Elasticad::AdComment'

  # nested attributes
  accepts_nested_attributes_for(:date)
  accepts_nested_attributes_for(:author)
  accepts_nested_attributes_for(:condition)
  accepts_nested_attributes_for(:seo)

  # validations
  validates :title,       presence: true
  validates :description, presence: true
  validates :type,        presence: true
  validates :state,       inclusion: { in: [:inactive, :active, :enabled, :disabled, :spam, :premium] }


  def price(currency_code = :usd)
    # prices.select(&:'currency_code == currency_code').first
    currency_code = currency_code.try(:upcase).to_s    
    prices.select do |price|
      price.currency_code.try(:upcase) == currency_code
    end.first.try(:amount)
  end
end
