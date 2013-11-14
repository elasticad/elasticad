# encoding: utf-8

require 'spec_helper'

describe Elasticad::Documents::Attachment do
  # fields
  specify do
    should have_field(:width)
              .of_type(Integer)
              .with_default_value_of(0) 
  end

  specify do
    should have_field(:height)
              .of_type(Integer)
              .with_default_value_of(0)
  end

  specify do
    should have_field(:file_size)
              .of_type(Integer)
              .with_default_value_of(0)
  end

  specify do
    should have_field(:content_type)
              .of_type(String)
              .with_default_value_of(nil)
  end

  specify do
    should have_field(:file_name)
              .of_type(String)
              .with_default_value_of(nil)
  end

  # specify { should be_timestamped_document }

  # relations
  specify { should be_embedded_in(:asset) }

  # validations
  specify { should validate_presence_of(:width) }

  specify do # TODO: max & min of the image width
    should validate_numericality_of(:width)
              .only_integer(true)
              .greater_than_or_equal_to(0)
              .less_than_or_equal_to(10000)
  end

  specify { should validate_presence_of(:height) }

  specify do # TODO: max & min of the image height
    should validate_numericality_of(:height)
              .only_integer(true)
              .greater_than_or_equal_to(0)
              .less_than_or_equal_to(10000)
  end

  specify { should validate_presence_of(:file_size) }

  specify do
    should validate_numericality_of(:file_size)
              .only_integer(true)
              .greater_than_or_equal_to(0)
              #.less_than_or_equal_to(10000)
  end

  specify { should validate_presence_of(:content_type) }

  specify { should validate_inclusion_of(:content_type).to_allow(MIME::Types[/^image/]) }

  specify { should validate_presence_of(:file_name) }

  # TODO: implement file name validator with options for validates_formatting_of gem
  # e.g.
  # validates :file_name, file_name: true
  # validates :file_name, file_name: { include_dir: true }
  # validates :file_name, file_name: { with_ext: false }
  # validates :file_name, file_name: { platform: :win }
  xspecify { should validate_format_of(:file_name) }

  it 'should all attribute have a valid format' do
    attachment_document = build(:attachment_document)
    attachment_document.should be_valid
  end
end
