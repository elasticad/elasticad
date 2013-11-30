# encoding: utf-8
require 'spec_helper'

describe Elasticad::Preference do
  describe 'fields' do
    specify do
      should have_field(:value)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:key)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:value_type)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify { should_not be_timestamped_document }
  end

  describe 'validations' do
    describe '#value field' do
      specify { should validate_presence_of(:value) }
      specify { should validate_length_of(:value).within(1..255) }
      it 'should accept only words'
    end

    describe '#key field' do
      specify { should validate_presence_of(:key) }
    end

    describe '#value_type field' do
      specify { should validate_presence_of(:value_type) }
      specify { should validate_length_of(:value_type).within(1..255) }
      it 'should accept only words'      
    end
  end

  describe 'attributes' do
    it 'should all attributes have a valid format' do
      preference = build(:preference)
      preference.should be_valid
    end
  end
end