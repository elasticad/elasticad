# encoding: utf-8
require 'spec_helper'

describe Elasticad::Documents::Date do
  describe 'fields' do
    specify do
      should have_field(:published_at)
                .of_type(DateTime)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:modified_at)
                .of_type(DateTime)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:expire_at)
                .of_type(DateTime)
                .with_default_value_of(nil)
    end

    specify do
      should have_field(:deleted_at)
                .of_type(DateTime)
                .with_default_value_of(nil)
    end

    specify { should_not be_timestamped_document }
  end

  describe 'relations' do
    specify { should be_embedded_in(:ad) }
  end

end
