# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Condition do
  specify { should have_field(:percentage).
                      of_type(Integer).
                      with_default_value_of(0) }

  specify { should have_field(:label).
                      of_type(String).
                      with_default_value_of(:old) }
  
  specify { should_not be_timestamped_document }
  
  specify { should validate_presence_of(:percentage) }
  specify { should validate_presence_of(:label) }

  specify { should be_embedded_in(:ad) }                       
end