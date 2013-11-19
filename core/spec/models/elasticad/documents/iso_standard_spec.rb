# encoding: utf-8

require 'spec_helper'

describe Elasticad::Documents::IsoStandard do
  describe 'fields' do
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
  end

  describe 'relations' do
    specify { should be_embedded_in(:country) }
  end

  describe 'validations' do
    describe '#iso_name field' do
      specify { should validate_presence_of(:iso_name) }
      specify { should validate_length_of(:iso_name).within(3..40) }

      specify do
        should validate_format_of(:iso_name)
                  .to_allow('Chand')
                  .not_to_allow('12%45987')
                  .not_to_allow('chand 134')
      end
    end

    describe '#iso field' do
      specify { should validate_presence_of(:iso) }

      specify do 
        should validate_format_of(:iso)
                  .to_allow('TD')
                  .not_to_allow('TCD')
                  .not_to_allow('T')
                  .not_to_allow('123')
      end
    end

    describe '#iso3 field' do
      specify { should validate_presence_of(:iso3) }
      
      specify do 
        should validate_format_of(:iso3)
                  .to_allow('TCD')
                  .not_to_allow('TD')
                  .not_to_allow('T')
                  .not_to_allow('123')
      end
    end
  end

  it '#iso_name attribute should only accepts letter'

  it 'should all attributes have a valid format' do
    iso_standard_document = build(:iso_standard_document)
    iso_standard_document.should be_valid
  end
end