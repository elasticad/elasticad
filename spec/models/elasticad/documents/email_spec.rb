# encoing: utf-8

require 'spec_helper'

describe Elasticad::Documents::Email do
  # fields
  specify { should have_field(:text).
                      of_type(String).
                      with_default_value_of(nil) }

  specify { should have_field(:display).
                      of_type(Boolean).
                      with_default_value_of(false) }

  specify { should have_field(:primary).
                      of_type(Boolean).
                      with_default_value_of(false) }

  specify { should_not be_timestamped_document }                                                                  

  # relations
  specify { should be_embedded_in(:address) }

  # validations
  specify { should validate_presence_of(:text) }

  specify { should validate_format_of(:text).
                      to_allow('me@example.dev').
                      not_to_allow('me at example dot dev') }

  let(:valid_attributes) { {text: 'me@example.dev', display: :false, primary: true} }
                      
  it 'should all attributes have a valid format' do
    email = Elasticad::Documents::Email.new(valid_attributes)
    email.should be_valid
  end
end
