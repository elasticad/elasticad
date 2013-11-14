# encoding: utf-8
require 'spec_helper'

describe Elasticad::City do
  describe 'fields' do
    specify do
      should have_field(:name)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:zipcode)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:state)
                .of_type(Symbol)
                .with_default_value_of(:inactive)
    end
  end

  describe 'relations' do
    specify { should belong_to(:region) }
    specify { should have_many(:city_areas) }
  end

  describe 'validations' do
    describe '#name field' do
      specify { should validate_presence_of(:name) }

      specify { should validate_length_of(:name).within(3..40) } 
    end

    describe '#zipcode field' do
      it 'should accepts only valid zip format'
    end

    describe '#state field' do
      specify do
        should validate_inclusion_of(:state)
                  .to_allow([:active, :inactive])
      end      
    end
  end

  it 'should all attributes have a valid format' do
    city = build(:city)
    city.should be_valid
  end
end