# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Seo do
  specify { should have_field(:permalink).
                      of_type(String).
                      with_default_value_of(nil) }

  specify { should_not be_timestamped_document }
  
  specify { should embed_one(:meta) }


  specify { should accept_nested_attributes_for(:meta) }

  specify { should validate_presence_of(:permalink) }

  specify { should validate_uniqueness_of(:permalink) }
end