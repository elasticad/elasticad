# encoding: utf-8
require 'spec_helper'

describe Elasticad::CityArea do
  describe 'fields' do
    specify do
      should have_field(:name)
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
    specify { should belong_to(:city) }
    specify { should embed_one(:coordinate) }
  end

  describe 'validations' do
    describe '#name field' do
      specify { should validate_presence_of(:name) }
      specify { should validate_length_of(:name).within(3..40) }
      it 'should accepts only words'
    end

    describe '#state field' do
      specify do
        should validate_inclusion_of(:state)
                  .to_allow([:active, :inactive])
      end      
    end
  end

  it 'should all attributes have a valid format' do
    city_area = build(:city_area)
    city_area.should be_valid
  end
end