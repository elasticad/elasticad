# encoding: utf-8

require 'spec_helper'

describe Elasticad::Documents::Hour do
  describe 'fields' do
    specify do
      should have_field(:from)
                .of_type(String)
                .with_default_value_of('00:00')
    end

    specify do
      should have_field(:to)
                .of_type(String)
                .with_default_value_of('24:00')
    end

    specify { should_not be_timestamped_document }
  end

  describe 'relations' do
    specify { should be_embedded_in(:availability) }
  end

  describe 'validations' do
    describe '#from field' do
      xspecify do
        should validate_format_of(:from)
                  .to_allow('00:00')
                  .not_to_allow('zzzz')
      end
    end

    describe '#to field' do
      xspecify do
        should validate_format_of(:to)
                  .to_allow('00:00')
                  .not_to_allow('zzzz')
      end
    end
  end
end
