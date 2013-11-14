# encoding: utf-8

require 'spec_helper'

describe Elasticad::Country do
  describe 'fields' do
    specify do
      should have_field(:name)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:numcode)
                .of_type(Integer)
                .with_default_value_of(0)
    end

    specify do
      should have_field(:states_required)
                .of_type(Boolean)
                .with_default_value_of(false)
    end

    specify do
      should have_field(:state)
                .of_type(Symbol)
                .with_default_value_of(:inactive)
    end

    specify { should be_timestamped_document }
  end

  describe 'relations' do
    specify { should embed_one(:iso_standard) }

    specify { should have_many(:regions) }
    
    specify { should have_many(:states) }    
  end

  describe 'nested attributes' do
    specify { should accept_nested_attributes_for(:iso_standard) }
  end

  describe 'validations' do
    describe '#name field' do
      specify { should validate_presence_of(:name) }

      specify { should validate_length_of(:name).within(3..40) }

      specify { should validate_uniqueness_of(:name) }
    end


    describe '#numcode field' do
      specify { should validate_presence_of(:numcode) }

      specify do
        should validate_numericality_of(:numcode)
                  .only_integer(true)
                  .greater_than_or_equal_to(0)
      end

      specify { should validate_uniqueness_of(:numcode) }
    end

    describe '#states_required field' do 
      specify do 
        should validate_inclusion_of(:states_required)
                  .to_allow([true, false])
      end
    end

    describe '#state field' do    
      specify do
        should validate_inclusion_of(:state)
                  .to_allow([:active, :inactive])
      end
    end
  end
  
  it 'should all attributes have a valid format' do
    valid_country = build(:country)
    valid_country.should be_valid
  end

  it '#name attribute should only accepts letter'

  describe 'create embedded documents' do
    it 'should create iso_standard document' do
      country = build(:country)
      country.build_iso_standard
      country.iso_standard.should_not be_nil
    end
  end
end
