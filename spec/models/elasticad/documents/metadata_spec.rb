# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Metadata do
  # fields
  specify do
    should have_field(:description)
              .of_type(String)
              .with_default_value_of(nil)
  end

  specify do
    should have_field(:keywords)
              .of_type(Array)
              .with_default_value_of([])
  end

  specify do
    should have_field(:title)
              .of_type(String)
              .with_default_value_of(nil)
  end

  specify { should_not be_timestamped_document }

  # relations
  specify { should be_embedded_in(:seo) }

  # validations
  specify { should validate_presence_of(:description) }
  specify { should validate_presence_of(:title) }
  specify { should validate_presence_of(:keywords) }

  let(:valid_attributes) { attributes_for(:metadata_document) }

  it 'should all attributes have a valid format' do
    valid_metadata_document = build(:metadata_document)
    valid_metadata_document.should be_valid
  end

  describe '#keywords attribute' do
    it 'should not valid with empty items' do
      invalid_keywords_attribute = valid_attributes.merge(keywords: [])
      invalid_metadata_document = build(:metadata_document,
                                        invalid_keywords_attribute)
      invalid_metadata_document.should_not be_valid
    end

    xit 'should not have a valid format with nil items' do
      invalid_keywords_attribute = valid_attributes.merge(keywords: ['', nil])
      invalid_metadata_document = build(:metadata_document,
                                        invalid_keywords_attribute)
      invalid_metadata_document.should_not be_valid
    end

    xit 'type of items should be only string type' do
      invalid_keywords_attribute = valid_attributes
                                      .merge(keywords: [:hello, true, 1000])
      invalid_metadata_document = build(:metadata_document,
                                        invalid_keywords_attribute)
      invalid_metadata_document.should_not be_valid
    end

    xit 'length of items should be greater than one' do
      invalid_keywords_attribute = valid_attributes.merge(keywords: ['less'])
      invalid_metadata_document = build(:metadata_document,
                                        invalid_keywords_attribute)
      invalid_metadata_document.should_not be_valid
    end

    xit 'length of items should be less than 10' do
    end
  end
end
