# encoding: utf-8

require 'spec_helper'

describe Elasticad::Documents::Phone do
  # fields
  specify do
    should have_field(:phone)
              .of_type(String)
              .with_default_value_of(nil)
  end

  specify do
    should have_field(:type)
              .of_type(Symbol)
              .with_default_value_of(:mobile)
  end

  specify { should_not be_timestamped_document }

  # relations
  specify { should be_embedded_in(:address) }

  # validations
  specify { should validate_presence_of(:phone) }

  specify { should validate_presence_of(:type) }

  xspecify do
    should validate_format_of(:phone)
              .to_allow('(+992) 90-777-77-77')
              .not_to_allow('abc123')
  end

  specify do
    should validate_inclusion_of(:type)
              .to_allow([:home, :work, :mobile])
  end

  specify { should validate_length_of(:phone).within(7..20) }

  let(:valid_attributes) { attributes_for(:phone_document) }

  it 'should valid only with phone format'

  it 'should all attributes have a valid format' do
    valid_phone_document = build(:phone_document)
    valid_phone_document.should be_valid
  end
end
