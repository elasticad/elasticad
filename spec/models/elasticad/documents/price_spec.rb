# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Price do
  # fields
  specify do
    should have_field(:amount)
              .of_type(Float)
              .with_default_value_of(0)
  end

  specify do
    should have_field(:currency_code)
              .of_type(String)
              .with_default_value_of(nil)
  end

  specify { should_not be_timestamped_document }

  # relations
  specify { should be_embedded_in(:ad) }

  # validations
  specify { should validate_presence_of(:amount) }

  specify do
    should validate_numericality_of(:amount)
              .greater_than_or_equal_to(0)
  end

  specify { should validate_presence_of(:currency_code) }
  specify { should validate_length_of(:currency_code).within(3..5) }
end
