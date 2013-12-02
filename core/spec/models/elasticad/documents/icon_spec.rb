# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Icon do
  describe 'fields' do
    specify do
      should have_field(:icon_file_name)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:icon_content_type)
                .of_type(String)
                .with_default_value_of('image/png')
    end

    specify do
      should have_field(:icon_file_size)
                .of_type(Integer)
                .with_default_value_of(0)
    end

    specify do
      should have_field(:icon_updated_at)
                .of_type(DateTime)
                .with_default_value_of(nil)
    end
    specify { should_not be_timestamped_document }
  end

  describe 'relations' do
    specify { should be_embedded_in(:taxonomy) }
  end

  describe 'validations' do
    xspecify { should validate_attachment_presence(:icon) }
    xspecify do 
      should validate_attachment_content_type(:icon)
                .allowing('image/png', 'image/gif', 'image/bmp', 'image/jpeg')
                .rejecting('text/plain', 'text/xml')
    end

    xspecify do 
      should validate_attachment_size(:icon)
                .less_than(2.megabytes)
    end

    describe '#file_name field' do
      xspecify { should validate_presence_of(:icon_file_name) }

      # TODO: implement file name validator with options for validates_formatting_of gem
      # e.g.
      # validates :file_name, file_name: true
      # validates :file_name, file_name: { include_dir: true }
      # validates :file_name, file_name: { with_ext: false }
      # validates :file_name, file_name: { platform: :win }
      xspecify { should validate_format_of(:icon_file_name) }      
    end

    describe '#content_type field' do
      xspecify { should validate_inclusion_of(:icon_content_type).to_allow(MIME::Types[/^image/]) }      
    end

    describe '#file_size field' do
      xspecify { should validate_presence_of(:icon_file_size) }

      xspecify do
        should validate_numericality_of(:icon_file_size)
                  .only_integer(true)
                  .greater_than_or_equal_to(0)
                  #.less_than_or_equal_to(10000)
      end
    end
  end

  describe 'attributes' do
    let(:icon) { build(:icon) }

    it 'should all attributes have a valid format' do
      icon.should be_valid
    end
  end

  describe 'attachment' do
    xspecify { should have_attached_file(:icon) }
  end
end