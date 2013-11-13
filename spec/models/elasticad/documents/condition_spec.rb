# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Condition do
  # fields
  specify do
    should have_field(:percentage)
              .of_type(Integer)
              .with_default_value_of(0)
  end

  specify do
    should have_field(:label)
              .of_type(Symbol)
              .with_default_value_of(:old)
  end

  specify { should_not be_timestamped_document }

  # relations
  specify { should be_embedded_in(:ad) }

  # validations
  specify { should validate_presence_of(:percentage) }

  specify do
    should validate_numericality_of(:percentage)
              .only_integer(true)
              .greater_than_or_equal_to(0)
              .less_than_or_equal_to(100)
  end

  specify { should validate_presence_of(:label) }

  specify do
    should validate_inclusion_of(:label)
              .to_allow([:old, :new, :good])
  end

  let(:valid_attributes) { attributes_for(:condition_document) }

  it 'should all attributes have a valid format' do
    valid_condition_document = build(:condition_document)
    valid_condition_document.should be_valid
  end

  it 'should not be valid with other label value' do
    invalid_label_attribute = valid_attributes.merge(label: :super)
    invalid_condition_document = build(:condition_document, invalid_label_attribute)
    invalid_condition_document.should_not be_valid
  end

end
