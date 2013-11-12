# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Price do
  # fields
  specify { should have_field(:amount).
                      of_type(Float).
                      with_default_value_of(0) }

  specify { should have_field(:currency_id).
                      of_type(String).
                      with_default_value_of(nil) }
  
  specify { should_not be_timestamped_document }
  
  # relations
  specify { should be_embedded_in(:ad) }

  # validations
  specify { should validate_presence_of(:amount) }
  specify { should validate_presence_of(:currency_id) }                   
end 