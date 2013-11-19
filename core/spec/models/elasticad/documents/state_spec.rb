# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::State do
  describe 'fields' do
    specify do
      should have_field(:premium)
                .of_type(Boolean)
                .with_default_value_of(false)
    end

    specify do
      should have_field(:enabled)
                .of_type(Boolean)
                .with_default_value_of(false)
    end

    specify do
      should have_field(:active)
                .of_type(Boolean)
                .with_default_value_of(false)
    end

    specify do
      should have_field(:spam)
                .of_type(Boolean)
                .with_default_value_of(false)
    end

    specify { should_not be_timestamped_document }
  end

  describe 'relations' do
    specify { should be_embedded_in(:ad) }
  end

  describe 'validations' do
    describe '#premium field' do
      specify do
        should validate_inclusion_of(:premium)
                  .to_allow([true, false])
      end
    end

    describe '#enabled field' do
      specify do
        should validate_inclusion_of(:enabled)
                  .to_allow([true, false])
      end
    end

    describe '#active field' do
      specify do
        should validate_inclusion_of(:active)
                  .to_allow([true, false])
      end
    end

    describe '#spam field' do
      specify do
        should validate_inclusion_of(:spam)
                  .to_allow([true, false])
      end
    end
  end
end
