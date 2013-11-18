# encoding: utf-8
require 'spec_helper'

describe Elasticad::Ad do
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
    specify { should embed_one(:state) }
    specify { should embed_one(:seo) }
    specify { should belong_to(:taxon) }
    specify { should have_many(:comments) }
  end

  describe 'nested attributes' do
    specify { should accept_nested_attributes_for(:date) }
    specify { should accept_nested_attributes_for(:author) }
    specify { should accept_nested_attributes_for(:condition) }
    specify { should accept_nested_attributes_for(:state) }
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
  end

  describe '#price attribute' do
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
      ad = create(:ad)
      ad.prices = [Elasticad::Documents::Price.new(amount: 200, currency_code: :dinor)]
      ad.price(:dinor).should eq 200
    end    

    it 'should return a random amount that match a currency' do
      ad = create(:ad)
      amount = rand(200..500)
      ad.prices = [Elasticad::Documents::Price.new(amount: amount, currency_code: :dinor)]
      ad.price(:dinor).should eq amount
    end

    it 'should return an amount for default currency' do
      ad = create(:ad)
      ad.prices = [Elasticad::Documents::Price.new(amount: 200, currency_code: :usd)]
      ad.price.should eq 200
    end

    it 'should be nil with unknown currency' do
      ad = create(:ad)
      ad.prices = [Elasticad::Documents::Price.new(amount: 200, currency_code: :dinor)]
      ad.price(:oops).should be_nil
    end        
  end

  describe 'create embedded documents' do
    it 'should create seo document' do
      ad = create(:ad)
      ad.create_seo
      ad.seo.should_not be_nil
    end

    it 'should create date document' do
      ad = create(:ad)
      ad.create_date
      ad.date.should_not be_nil
    end

    it 'should create author document' do
      ad = create(:ad)
      ad.create_author
      ad.author.should_not be_nil
    end

    it 'should create condition document' do
      ad = create(:ad)
      ad.create_condition
      ad.condition.should_not be_nil
    end

    it 'should create state document do' do
      ad = create(:ad)
      ad.create_state
      ad.state.should_not be_nil
    end
  end
end
