# encoding: utf-8
require 'spec_helper'

describe Elasticad::Taxonomy do
  describe 'fields' do
    specify do
      should have_field(:parent_id)
                .of_type(BSON::ObjectId)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:position)
                .of_type(Integer)
                .with_default_value_of(0)
    end

    specify do
      should have_field(:name)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:description)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:lft)
                .of_type(Integer)
                .with_default_value_of(0)
    end

    specify do
      should have_field(:rgt)
                .of_type(Integer)
                .with_default_value_of(0)
    end

    specify do
      should have_field(:depth)
                .of_type(Integer)
                .with_default_value_of(0)
    end

    specify { should be_timestamped_document }
  end

  describe 'relations' do
    specify { should embed_one(:icon) }
    specify { should embed_one(:seo) }
  end

  describe 'nested attributes' do
    specify { should accept_nested_attributes_for(:icon) }
    specify { should accept_nested_attributes_for(:seo) }
  end

  describe 'validations' do
    describe '#position field' do
      specify do
        should validate_numericality_of(:position)
                  .only_integer(true)
                  .greater_than_or_equal_to(0)
      end    
    end

    describe '#name field' do
      specify { should validate_presence_of(:name) }
      specify { should validate_length_of(:name).within(3..255) }
      it 'should accept only words'
    end

    describe '#description field' do
      specify { should validate_presence_of(:description) }
      specify { should validate_length_of(:description).within(3..500) }
      it 'should accept only words'
    end

    describe '#lft field' do
      specify do
        should validate_numericality_of(:lft)
                  .only_integer(true)
                  .greater_than_or_equal_to(0)
      end    
    end

    describe '#rgt field' do
      specify do
        should validate_numericality_of(:rgt)
                  .only_integer(true)
                  .greater_than_or_equal_to(0)
      end    
    end

    describe '#depth field' do
      specify do
        should validate_numericality_of(:depth)
                  .only_integer(true)
                  .greater_than_or_equal_to(0)
      end
    end
  end

  let(:taxonomy) { create(:taxonomy) }

  it 'should all attributes have a valid format' do
    taxonomy.should be_valid
  end

  describe 'create embedded documents' do
    it 'should create seo document' do
      taxonomy.create_seo
      taxonomy.seo.should_not be_nil
    end

    it 'should create icon document' do
      taxonomy.create_icon
      taxonomy.icon.should_not be_nil
    end
  end

end