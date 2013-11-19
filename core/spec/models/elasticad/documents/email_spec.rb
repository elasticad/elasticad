# encoding: utf-8

require 'spec_helper'

describe Elasticad::Documents::Email do
  describe 'fields' do
    specify do
      should have_field(:email)
                .of_type(String)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:display)
                .of_type(Boolean)
                .with_default_value_of(false)
    end

    specify do
      should have_field(:primary)
                .of_type(Boolean)
                .with_default_value_of(false)
    end

    specify { should_not be_timestamped_document }
  end
 
  describe 'relations' do
    specify { should be_embedded_in(:address) }
  end

  describe 'validations' do
    describe '#email field' do
      specify { should validate_presence_of(:email) }

      specify do
        should validate_format_of(:email)
                  .to_allow('me@example.dev')
                  .not_to_allow('me at example dot dev')
      end
    end

    describe '#primary field' do
      specify do
        should validate_inclusion_of(:primary)
                  .to_allow([true, false])
      end
    end

    describe '#display field' do
      specify do
        should validate_inclusion_of(:display)
                  .to_allow([true, false])
      end
    end
  end
  
  let(:valid_attributes) { attributes_for(:email_document) }

  it 'should all attributes have a valid format' do
    valid_email_document = build(:email_document)
    valid_email_document.should be_valid
  end

end
