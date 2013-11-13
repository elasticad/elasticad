# encoding: utf-8

require 'spec_helper'

describe Elasticad::Documents::Name do
  # fields
  specify do
    should have_field(:first_name)
              .of_type(String)
              .with_default_value_of('')
  end

  specify do
    should have_field(:middle_name)
              .of_type(String)
              .with_default_value_of('')
  end

  specify do
    should have_field(:last_name)
              .of_type(String)
              .with_default_value_of('')
  end

  specify { should_not be_timestamped_document }

  # relations
  specify { should be_embedded_in(:address) }

  # validations
  specify { should validate_presence_of(:first_name) }
  specify { should validate_presence_of(:last_name) }
  specify { should validate_length_of(:first_name).within(3..20) }
  specify { should validate_length_of(:middle_name).within(3..20) }
  specify { should validate_length_of(:last_name).within(3..20) }

  describe '#first_name attribute' do
    it 'should valid only with letter characters'
  end

  describe '#middle_name attribute' do
    it 'should valid only with letter characters'
  end

  describe '#last_name attribute' do
    it 'should valid only with letter characters'
  end
end
