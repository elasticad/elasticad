# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Author do
  describe 'fields' do
    specify do
      should have_field(:ip)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify { should_not be_timestamped_document }
  end

  describe 'relations' do
    specify { should be_embedded_in(:ad) }

    specify { should belong_to(:address) }
    specify { should belong_to(:user) }
  end

  describe 'validations' do
    describe '#ip field' do
      specify { should validate_presence_of(:ip) }

      specify do
        should validate_format_of(:ip)
                          .to_allow('127.0.0.1')
                          .not_to_allow('127001')
      end
    end
  end

  
  it 'should create address document' do
    author_document = build(:author_document)
    author_document.build_address
    author_document.address.should_not be_nil
  end
end
