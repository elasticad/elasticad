# encoding: utf-8
require 'spec_helper'

describe Elasticad::State do
  let(:state) { build(:state) }
  
  describe 'fields' do
    specify do
      should have_field(:name)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:abbr)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:state)
                .of_type(Symbol)
                .with_default_value_of(:inactive)
    end

    specify { should be_timestamped_document }
  end

  describe 'relations' do
    specify { should belong_to(:country) }
  end

  describe 'validations' do
    describe '#name field' do
      specify { should validate_presence_of(:name) }
      specify { should validate_length_of(:name).within(3..40) }
      it 'should accept only words'
    end

    describe '#abbr field' do
      specify { should validate_presence_of(:abbr) }

      specify do 
        should validate_format_of(:abbr)
                  .to_allow('MI')
                  .not_to_allow('M1')
                  .not_to_allow('MII')
      end
    end

    describe '#state field' do
      specify do
        should validate_inclusion_of(:state)
                  .to_allow([:active, :inactive])
      end      
    end
  end

  describe '#state attribute' do
    it 'should be kind of a StringInquiry object' do
      state.state.should be_kind_of(ActiveSupport::StringInquirer)
    end

    it 'should be active' do
      state.state = :active
      state.state.should be_active
    end

    it 'should not be active' do
      state.state = :inactive
      state.state.should_not be_active
    end
  end

  it 'should all attributes have a valid format' do
    state.should be_valid
  end
end