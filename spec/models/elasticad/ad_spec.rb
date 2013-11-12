# encoding: utf-8
require 'spec_helper'

describe Elasticad::Ad do
  # fields
  # specify { should have_field(:taxon_id).
  #                     of_type(BSON::ObjectId).
  #                     with_default_value_of(0) }

  specify { should have_field(:title).
                      of_type(String).
                      with_default_value_of(nil) }

  specify { should have_field(:description).
                      of_type(String).
                      with_default_value_of(nil) }

  specify { should have_field(:type).
                      of_type(String).
                      with_default_value_of(nil) }

  specify { should have_field(:placement_period).
                      of_type(Integer).
                      with_default_value_of(0) }

  # specify { should have_field(:prices).
  #                     of_type(Array).
  #                     with_default_value_of([]) }

  specify { should have_field(:activation_hash).
                      of_type(String).
                      with_default_value_of(nil) } 
   
  specify { should be_timestamped_document }                    
  
  # relations
  specify { should embed_many(:prices) }

  specify { should embed_one(:date) }
  specify { should embed_one(:author) }
  specify { should embed_one(:condition) }
  specify { should embed_one(:state) }
  specify { should embed_one(:seo) }
  specify { should belong_to(:taxon) }
  
  # nested attributes
  specify { should accept_nested_attributes_for(:date) }
  specify { should accept_nested_attributes_for(:author) }
  specify { should accept_nested_attributes_for(:condition) }
  specify { should accept_nested_attributes_for(:state) }
  specify { should accept_nested_attributes_for(:seo) }

  # validations
  specify { should validate_presence_of(:title) }
  specify { should validate_presence_of(:description) }
  specify { should validate_presence_of(:type) }
end
