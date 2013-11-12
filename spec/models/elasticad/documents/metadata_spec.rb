# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Metadata do
  # fields
  specify { should have_field(:description).
                      of_type(String).
                      with_default_value_of(nil) }

  specify { should have_field(:keywords).
                      of_type(Array).
                      with_default_value_of([]) }

  specify { should have_field(:title).
                      of_type(String).
                      with_default_value_of(nil) }                       


  specify { should_not be_timestamped_document }
  
  # relations
  specify { should be_embedded_in(:seo) }

  # validations
  specify { should validate_presence_of(:description) }
  specify { should validate_presence_of(:title) }

end