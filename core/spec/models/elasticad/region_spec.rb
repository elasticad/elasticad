# encoding: utf-8

require 'spec_helper'

describe Elasticad::Region do
  let(:region) { build(:region) }
  
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
    specify { should belong_to(:country) }
    specify { should have_many(:cities) }
  end

  describe 'validations' do
    describe '#name field' do
      specify { should validate_presence_of(:name) }

      specify { should validate_length_of(:name).within(3..40) }
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
        region.state.should be_kind_of(ActiveSupport::StringInquirer)
      end

      it 'should be active' do
        region.state = :active
        region.state.should be_active
      end

      it 'should not be active' do
        region.state = :inactive
        region.state.should_not be_active
      end
    end

    it 'should all attributes have a valid format' do
      region.should be_valid
    end
  end
end
