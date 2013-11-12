# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Author do
  # fields
  specify do
    should have_field(:ip)
              .of_type(String)
              .with_default_value_of(nil)
  end

  specify { should_not be_timestamped_document }

  # relations
  specify { should be_embedded_in(:ad) }

  specify { should belong_to(:address) }
  specify { should belong_to(:user) }

  # validation
  specify { should validate_presence_of(:ip) }

  specify do
    should validate_format_of(:ip)
                      .to_allow('127.0.0.1')
                      .not_to_allow('127001')
  end
end
