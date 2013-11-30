# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Icon do
  describe 'fields' do
    specify do
      should have_field(:file_name)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:content_type)
                .of_type(String)
                .with_default_value_of('image/png')
    end

    specify do
      should have_field(:file_size)
                .of_type(Integer)
                .with_default_value_of(0)
    end

    specify { should_not be_timestamped_document }
  end

  describe 'relations' do
    specify { should be_embedded_in(:taxonomy) }
  end

  describe 'validations' do
    describe '#file_name field' do
      specify { should validate_presence_of(:file_name) }

      # TODO: implement file name validator with options for validates_formatting_of gem
      # e.g.
      # validates :file_name, file_name: true
      # validates :file_name, file_name: { include_dir: true }
      # validates :file_name, file_name: { with_ext: false }
      # validates :file_name, file_name: { platform: :win }
      xspecify { should validate_format_of(:file_name) }      
    end

    describe '#content_type field' do
      specify { should validate_inclusion_of(:content_type).to_allow(MIME::Types[/^image/]) }      
    end

    describe '#file_size field' do
      specify { should validate_presence_of(:file_size) }

      specify do
        should validate_numericality_of(:file_size)
                  .only_integer(true)
                  .greater_than_or_equal_to(0)
                  #.less_than_or_equal_to(10000)
      end
    end
  end

  let(:icon) { build(:icon) }

  it 'should all attributes have a valid format' do
    icon.should be_valid
  end  
end