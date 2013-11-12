# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::State do
  # fields
  specify { should have_field(:premium).
                      of_type(Boolean).
                      with_default_value_of(false) }  
  
  specify { should have_field(:enabled).
                      of_type(Boolean).
                      with_default_value_of(false) }

  specify { should have_field(:active).
                      of_type(Boolean).
                      with_default_value_of(false) }                                          

  specify { should have_field(:spam).
                      of_type(Boolean).
                      with_default_value_of(false) }

  specify { should_not be_timestamped_document }
  
  specify { should be_embedded_in(:ad) }

                                              
end