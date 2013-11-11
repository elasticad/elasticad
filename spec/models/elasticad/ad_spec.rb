require 'spec_helper'

describe Elasticad::Ad do
  # fields
  specify { should respond_to(:taxon_id) }
  specify { should respond_to(:title) }
  specify { should respond_to(:description) }
  specify { should respond_to(:type) }
  specify { should respond_to(:placement_period) } #

  specify { should respond_to(:seo) }

  # relations

  # validations
  specify { should validate_presence_of(:title) }
  specify { should validate_presence_of(:description) }
  specify { should validate_presence_of(:type) }
end
