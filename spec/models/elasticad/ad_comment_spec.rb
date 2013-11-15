# encoding: utf-8
require 'spec_helper'

describe Elasticad::AdComment do
  describe 'fields' do
    specify do
      should have_field(:title)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:body)
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
    specify { should belong_to(:ad) }
    specify { should embed_one(:author) }  
  end

  describe 'validations' do
    describe '#title field' do
      specify { should validate_presence_of(:title) }
      specify { should validate_length_of(:title).within(5..40) }

    end

    describe '#body field' do
      specify { should validate_presence_of(:body) }
      specify { should validate_length_of(:body).within(10..500) }
    end

    describe '#state field' do
      specify do 
        should validate_inclusion_of(:state)
                  .to_allow([:inactive, :active, :enabled, :disabled, :spam])
      end
    end

    describe '#author document' do
      specify { should validate_presence_of(:author) }
    end
  end

  it 'should all attributes have a valid format' do
    ad_comment = build(:created_ad_comment_child)
    ad_comment.should be_valid
  end
end
