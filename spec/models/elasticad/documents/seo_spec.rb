# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Seo do
  specify do
    should have_field(:permalink)
              .of_type(String)
              .with_default_value_of(nil)
  end

  specify { should_not be_timestamped_document }

  specify { should embed_one(:meta_data) }

  specify { should be_embedded_in(:ad) }

  specify { should accept_nested_attributes_for(:meta_data) }

  specify { should validate_presence_of(:permalink) }

  specify { should validate_uniqueness_of(:permalink) }

  it 'should create metadata document' do
    seo_document = build(:seo_document)
    seo_document.build_meta_data
    seo_document.meta_data.should_not be_nil
  end
end
