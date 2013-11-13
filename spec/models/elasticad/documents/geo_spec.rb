# encoding: utf-8

require 'spec_helper'

describe Elasticad::Documents::Geo do
  # fields
  specify do
    should have_field(:latitude)
              .of_type(Float)
              .with_default_value_of(0)
  end

  specify do
    should have_field(:longitude)
              .of_type(Float)
              .with_default_value_of(0)
  end

  specify { should_not be_timestamped_document }

  # relations
  specify { should be_embedded_in(:address) }

  # validations
  specify do
    should validate_numericality_of(:latitude)
              .greater_than_or_equal_to(0)
  end

  specify do
    should validate_numericality_of(:longitude)
              .greater_than_or_equal_to(0)
  end

  it 'should all attributes have a valid format' do
    valid_geo_document = build(:geo_document)
    valid_geo_document.should be_valid
  end
end
