# encoding: utf-8

require 'spec_helper'

describe Elasticad::Documents::Email do
  # fields
  specify do
    should have_field(:text)
              .of_type(String)
              .with_default_value_of(nil)
  end

  specify do
    should have_field(:display)
              .of_type(Boolean)
              .with_default_value_of(false)
  end

  specify do
    should have_field(:primary)
              .of_type(Boolean)
              .with_default_value_of(false)
  end

  specify { should_not be_timestamped_document }

  # relations
  specify { should be_embedded_in(:address) }

  # validations
  specify { should validate_presence_of(:text) }

  specify do
    should validate_format_of(:text)
              .to_allow('me@example.dev')
              .not_to_allow('me at example dot dev')
  end

  specify do
    should validate_inclusion_of(:primary)
              .to_allow([true, false])
  end

  specify do
    should validate_inclusion_of(:display)
              .to_allow([true, false])
  end

  let(:valid_attributes) { attributes_for(:email_document) }


  it 'should all attributes have a valid format' do
    valid_email_document = build(:email_document)
    valid_email_document.should be_valid
  end
 
end
