# encoding: utf-8
require 'spec_helper'

describe Elasticad::Ad do
  let(:ad) { create(:ad) }

  describe 'fields' do
    # specify { should have_field(:taxon_id).
    #                     of_type(BSON::ObjectId).
    #                     with_default_value_of(0) }

    specify do
      should have_field(:title)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:description)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:type)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:placement_period)
                .of_type(Integer)
                .with_default_value_of(0)
    end

    specify do
      should have_field(:state)
                .of_type(Symbol)
                .with_default_value_of(:inactive)
    end

    # specify { should have_field(:prices).
    #                     of_type(Array).
    #                     with_default_value_of([]) }

    specify do
      should have_field(:activation_hash)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify { should be_timestamped_document }
  end

  describe 'relations' do
    specify { should embed_many(:prices) }
    specify { should embed_one(:date) }
    specify { should embed_one(:author) }
    specify { should embed_one(:condition) }
    specify { should embed_one(:seo) }
    specify { should belong_to(:taxon) }
    specify { should have_many(:comments) }
  end

  describe 'nested attributes' do
    specify { should accept_nested_attributes_for(:date) }
    specify { should accept_nested_attributes_for(:author) }
    specify { should accept_nested_attributes_for(:condition) }
    specify { should accept_nested_attributes_for(:seo) }
  end

  describe 'validations' do
    describe '#title field' do
      specify { should validate_presence_of(:title) }
    end

    describe '#description field' do
      specify { should validate_presence_of(:description) }
    end

    describe '#type field' do
      specify { should validate_presence_of(:type) }
    end

    describe '#state field' do
      specify do
        should validate_inclusion_of(:state)
                  .to_allow([:inactive, :active, :enabled, :disabled, :spam, :premium])
      end
    end
  end

  describe '#price attribute' do
    let(:price_attributes) { {amount: 200, currency_code: :dinor} }

    specify { should respond_to(:price) }

    it 'should receive price with default currency parameter' do
      subject.should_receive(:price)
      subject.price
    end

    it 'should receive price with currency' do
      subject.should_receive(:price).with(:usd)
      subject.price(:usd)
    end

    it 'should receive price with parameter as a String object' do
      subject.should_receive(:price).with(kind_of(String))
      subject.price('usd')
    end

    it 'should receive price with parameter as a Symbol object' do
      subject.should_receive(:price).with(kind_of(Symbol))
      subject.price(:usd)
    end

    it 'should return an amount that match a currency' do
      ad.prices = [build(:price_document, price_attributes)]
      ad.price(:dinor).should eq 200
    end

    it 'should return a random amount that match a currency' do
      amount = rand(200..500)
      ad.prices = [build(:price_document, price_attributes.merge(amount: amount))]
      ad.price(:dinor).should eq amount
    end

    it 'should return an amount for default currency' do
      ad.prices = [build(:price_document, price_attributes.merge(currency_code: :usd))]
      ad.price.should eq 200
    end

    it 'should be nil with unknown currency' do
      ad.prices = [build(:price_document, price_attributes)]
      ad.price(:oops).should be_nil
    end        
  end

  describe '#state attribute' do
    it 'should be kind of a StringInquiry object' do
      ad.state.should be_kind_of(ActiveSupport::StringInquirer)
    end

    it 'should be active' do
      ad.state = :active
      ad.state.should be_active
    end

    it 'should not be active' do
      ad.state = :inactive
      ad.state.should_not be_active
    end

    it 'should be enabled' do
      ad.state = :enabled
      ad.state.should be_enabled
    end

    it 'should not be enabled' do
      ad.state = :disabled
      ad.state.should_not be_enabled
    end

    it 'should be spam' do
      ad.state = :spam
      ad.state.should be_spam
    end

    it 'should not be spam' do
      ad.state = :active
      ad.state.should_not be_spam
    end

    it 'should be premium' do
      ad.state = :premium
      ad.state.should be_premium
    end

    it 'should not be premium' do
      ad.state = :active
      ad.state.should_not be_premium
    end            
  end

  describe 'create embedded documents' do
    it 'should create seo document' do
      ad.create_seo
      ad.seo.should_not be_nil
    end

    it 'should create date document' do
      ad.create_date
      ad.date.should_not be_nil
    end

    it 'should create author document' do
      ad.create_author
      ad.author.should_not be_nil
    end

    it 'should create condition document' do
      ad.create_condition
      ad.condition.should_not be_nil
    end
  end
end
