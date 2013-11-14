# encoding: utf-8

require 'spec_helper'

describe Elasticad::Address do
  describe 'fields' do
    specify do
      should have_field(:addresses)
                .of_type(Array)
                .with_default_value_of([])
    end

    specify do
      should have_field(:type)
                .of_type(Symbol)
                .with_default_value_of(:personal)
    end

    specify do
      should have_field(:company)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:websites)
                .of_type(Array)
                .with_default_value_of([])
    end

    specify { should be_timestamped_document }
  end

  describe 'relations' do
    specify { should embed_one(:name) }

    specify { should belong_to(:city) }

    specify { should belong_to(:city_area) }

    specify { should embed_one(:availability) }

    specify { should embed_many(:phones) }

    specify { should embed_many(:emails) }

    specify { should embed_one(:coordinate) }
  end

  describe 'nested attributes' do
    specify { should accept_nested_attributes_for(:name) }

    specify { should accept_nested_attributes_for(:availability) }

    specify { should accept_nested_attributes_for(:coordinate) }
  end

  describe 'validations' do
    describe '#type field' do
      specify { should validate_presence_of(:type) }
    end

    describe '#phones field' do
      specify { should validate_presence_of(:phones) }
    end

    describe '#emails field' do
      specify { should validate_presence_of(:emails) }
    end
  end

  let(:valid_attributes) { attributes_for(:address) }

  it 'should all attributes have a valid format' do
    valid_address = build(:built_address_child)
    valid_address.should be_valid
  end

  describe '#emails attribute' do
    it 'should not valid with empty items' do
      invalid_address = build(:built_address_child)
      invalid_address.emails = []
      invalid_address.should_not be_valid
    end

    xit 'length of items should be less than 10' do
    end
  end

  describe '#phones attribute' do
    it 'should not valid with empty items' do
      invalid_address = build(:built_address_child)
      invalid_address.phones = []
      invalid_address.should_not be_valid
    end

    xit 'length of items should be less than 10' do
    end
  end

  describe '#addresses attribute' do
    xit 'should not valid with empty items' do
      invalid_addresses_attribute = valid_attributes.merge(addresses: [])
      invalid_address = build(:built_address_child,
                              invalid_addresses_attribute)
      invalid_address.should_not be_valid
    end

    xit 'should not have a valid format with nil items' do
      invalid_addresses_attribute = valid_attributes
                                      .merge(addresses: ['', nil])
      invalid_address = build(:built_address_child,
                              invalid_addresses_attribute)
      invalid_address.should_not be_valid
    end

    xit 'type of items should be only string type' do
      invalid_addresses_attribute = valid_attributes
                                      .merge(addresses: [:hello, true, 1000])
      invalid_address = build(:built_address_child,
                              invalid_addresses_attribute)
      invalid_address.should_not be_valid
    end

    xit 'length of items should be less than 10' do
    end
  end

  describe '#websites attribute' do
    xit 'should not valid with empty items' do
      invalid_websites_attribute = valid_attributes.merge(websites: [])
      invalid_address = build(:built_address_child,
                              invalid_websites_attribute)
      invalid_address.should_not be_valid
    end

    xit 'should not have a valid format with nil items' do
      invalid_websites_attribute = valid_attributes
                                      .merge(websites: ['', nil])
      invalid_address = build(:built_address_child,
                              invalid_websites_attribute)
      invalid_address.should_not be_valid
    end

    xit 'type of items should be only url format' do
      invalid_websites_attribute = valid_attributes
                                      .merge(websites: [:hello, true, 1000])
      invalid_address = build(:built_address_child,
                              invalid_websites_attribute)
      invalid_address.should_not be_valid
    end

    xit 'length of items should be less than 10' do
    end
  end

  describe 'create embedded documents' do
    let(:address) { build(:address) }

    it 'should create name document' do
      address.build_name
      address.name.should_not be_nil
    end

    it 'should create availability document' do
      address.build_availability
      address.availability.should_not be_nil
    end

    it 'should create geo coordinate document' do
      address.build_coordinate
      address.coordinate.should_not be_nil
    end
  end
end
