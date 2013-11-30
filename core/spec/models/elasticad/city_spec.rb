# encoding: utf-8
require 'spec_helper'

describe Elasticad::City do
  let(:city) { build(:city) }

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

    specify { should be_timestamped_document }
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
      it 'should accept only valid zip format'
    end

    describe '#state field' do
      specify do
        should validate_inclusion_of(:state)
                  .to_allow([:active, :inactive])
      end      
    end
  end

  describe 'attributes' do
    describe '#state attribute' do
      it 'should be kind of a StringInquiry object' do
        city.state.should be_kind_of(ActiveSupport::StringInquirer)
      end

      it 'should be active' do
        city.state = :active
        city.state.should be_active
      end

      it 'should not be active' do
        city.state = :inactive
        city.state.should_not be_active
      end
    end
    
    it 'should all attributes have a valid format' do
      city.should be_valid
    end
  end
  
end