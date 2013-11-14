# encoding: utf-8

require 'spec_helper'

describe Elasticad::Documents::IsoStandard do
  # fields
  specify do
    should have_field(:iso_name)
              .of_type(String)
              .with_default_value_of(nil)
  end

  specify do
    should have_field(:iso)
              .of_type(String)
              .with_default_value_of(nil)
  end

  specify do
    should have_field(:iso3)
              .of_type(String)
              .with_default_value_of(nil)
  end

  specify { should_not be_timestamped_document }

  # relations
  specify { should be_embedded_in(:country) }

  # validations
  specify { should validate_presence_of(:iso_name) }

  specify { should validate_presence_of(:iso) }

  specify { should validate_presence_of(:iso3) }

  specify { should validate_length_of(:iso_name).within(3..40) }

  specify do 
    should validate_format_of(:iso)
              .to_allow('TD')
              .not_to_allow('TCD')
              .not_to_allow('T')
              .not_to_allow('123')
  end

  specify do 
    should validate_format_of(:iso3)
              .to_allow('TCD')
              .not_to_allow('TD')
              .not_to_allow('T')
              .not_to_allow('123')
  end

  specify do
    should validate_format_of(:iso_name)
              .to_allow('Chand')
              .not_to_allow('12%45987')
              .not_to_allow('chand 134')
  end

  it '#iso_name attribute should only accepts letter'

  it 'should all attributes have a valid format' do
    iso_standard_document = build(:iso_standard_document)
    iso_standard_document.should be_valid
  end
end