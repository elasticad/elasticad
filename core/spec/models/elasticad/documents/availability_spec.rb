# encoding: utf-8

require 'spec_helper'

describe Elasticad::Documents::Availability do
  describe 'fields' do
    specify do
      should have_field(:days)
                .of_type(Array)
                .with_default_value_of([])
    end

    specify { should_not be_timestamped_document }
  end

  describe 'relations' do
    specify { should be_embedded_in(:address) }
    specify { should embed_many(:hours) }
  end

  describe 'validations' do
    describe '#days field' do
      xspecify do # only for items
        should validate_numericality_of(:days)
                  .only_integer(true)
                  .greater_than_or_equal_to(0)
                  .less_than_or_equal_to(7)
      end

      xspecify do # only for items
        should validate_inclusion_of(:days).to_allow(0..7)
      end
    end
  end
  
  describe 'attributes' do  
    let(:valid_attributes) { attributes_for(:availability_document) }

    it 'should all attributes have a valid format' do
      valid_availability_document = build(:availability_document)
      valid_availability_document.should be_valid
    end

    describe '#days attribute' do
      xit 'should not valid with empty items' do
        invalid_days_attribute = valid_attributes.merge(days: [])
        invalid_availability_document = build(:availability_document,
                                              invalid_days_attribute)
        invalid_availability_document.should_not be_valid
      end

      xit 'should not have a valid format with nil items' do
        invalid_days_attribute = valid_attributes.merge(days: ['', nil])
        invalid_availability_document = build(:availability_document,
                                              invalid_days_attribute)
        invalid_availability_document.should_not be_valid
      end

      xit 'type of items should be only integer type' do
        invalid_days_attribute = valid_attributes
                                        .merge(days: [:hello, true, 'hello'])
        invalid_availability_document = build(:availability_document,
                                              invalid_days_attribute)
        invalid_availability_document.should_not be_valid
      end

      xit 'length of items should be greater than one' do
        invalid_days_attribute = valid_attributes.merge(days: [1])
        invalid_availability_document = build(:availability_document,
                                              invalid_days_attribute)
        invalid_availability_document.should_not be_valid
      end

      xit 'length of items should be less than 7' do
      end
    end
  end
  
  describe 'create embedded documents' do
    let(:availability_document) { build(:availability_document) }

    it 'should create hours document' do
      availability_document.hours.build
      availability_document.hours.should_not be_empty
    end
  end
end
