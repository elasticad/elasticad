# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Date do
  specify { should have_field(:published_at).
                      of_type(DateTime).
                      with_default_value_of(nil) }

  specify { should have_field(:modified_at).
                      of_type(DateTime).
                      with_default_value_of(nil) } 

  specify { should have_field(:expire_at).
                      of_type(DateTime).
                      with_default_value_of(nil) }                      

  specify { should have_field(:deleted_at).
                      of_type(DateTime).
                      with_default_value_of(nil) }

  specify { should_not be_timestamped_document }                    

  specify { should be_embedded_in(:ad) }


end