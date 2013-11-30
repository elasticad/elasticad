# encoding: utf-8

require 'spec_helper'

describe Elasticad::Documents::Name do
  describe 'fields' do
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
  end

  describe 'relations' do
    specify { should be_embedded_in(:address) }
  end

  describe 'validations' do
    describe '#first_name field' do
      specify { should validate_presence_of(:first_name) }
      specify { should validate_length_of(:first_name).within(3..20) }
    end

    describe '#middle_name field' do
      specify { should validate_length_of(:middle_name).within(3..20) }
    end

    describe '#last_name field' do
      specify { should validate_presence_of(:last_name) }
      specify { should validate_length_of(:last_name).within(3..20) }
    end
  end

  describe 'attributes' do
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
end
