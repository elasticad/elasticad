# encoding: utf-8

describe Elasticad::Asset do
  # fields
  specify do
    should have_field(:position)
              .of_type(Integer)
              .with_default_value_of(0)
  end

  specify do
    should have_field(:type)
              .of_type(String)
              .with_default_value_of(nil)
  end

  specify do
    should have_field(:alt)
              .of_type(String)
              .with_default_value_of(nil)
  end

  specify { should be_timestamped_document }

  # relations
  specify { should embed_one(:attachment) }

  # nested attributes
  specify { should accept_nested_attributes_for(:attachment) }
  
  # validation
  specify do
    should validate_numericality_of(:position)
              .only_integer(true)
              .greater_than_or_equal_to(0)
  end

  describe 'create embedded documents' do
    it 'shoud create attachment document' do
      asset = build(:asset)
      asset.build_attachment
      asset.attachment.should_not be_nil  
    end
  end
end
