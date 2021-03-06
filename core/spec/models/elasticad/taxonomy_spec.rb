# encoding: utf-8
require 'spec_helper'

describe Elasticad::Taxonomy do
  let(:taxonomy) { create(:taxonomy) }

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

    specify do
      should have_field(:state)
                .of_type(Symbol)
                .with_default_value_of(:inactive)
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
      xspecify { should validate_presence_of(:description) }
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
        taxonomy.state.should be_kind_of(ActiveSupport::StringInquirer)
      end

      it 'should be active' do
        taxonomy.state = :active
        taxonomy.state.should be_active
      end

      it 'should not be active' do
        taxonomy.state = :inactive
        taxonomy.state.should_not be_active
      end
    end
    
    it 'should all attributes have a valid format' do
      taxonomy.should be_valid
    end
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


  # context "set_permalink" do
  #   let(:taxon) { Elasticad::Taxonomy.new(:name => "Ruby on Rails") }

  #   it "should set permalink correctly when no parent present" do
  #     taxon.set_permalink
  #     taxon.seo.permalink.should == "ruby-on-rails"
  #   end

  #   it "should support Chinese characters" do
  #     taxon.name = "你好"
  #     taxon.set_permalink
  #     taxon.seo.permalink.should == 'ni-hao'
  #   end

  #   context "with parent taxon" do
  #     before do
  #       taxon.stub :parent_id => 123
  #       taxon.stub :parent => mock_model(Elasticad::Taxonomy, :permalink => "brands")
  #     end

  #     it "should set permalink correctly when taxon has parent" do
  #       taxon.set_permalink
  #       taxon.seo.permalink.should == "brands/ruby-on-rails"
  #     end

  #     it "should set permalink correctly with existing permalink present" do
  #       taxon.seo.permalink = "b/rubyonrails"
  #       taxon.set_permalink
  #       taxon.seo.permalink.should == "brands/rubyonrails"
  #     end

  #     it "should support Chinese characters" do
  #       taxon.name = "我"
  #       taxon.set_permalink
  #       taxon.seo.permalink.should == "brands/wo"
  #     end
  #   end
  # end
end