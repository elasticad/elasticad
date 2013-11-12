# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Author do
  # fields
  specify { should have_field(:ip).
                      of_type(String).
                      with_default_value_of(nil) }

  specify { should_not be_timestamped_document }                      
  
  # relations
  specify { should be_embedded_in(:ad) }
  
  # validation
  specify { should validate_presence_of(:ip) }
end