require_relative '../spec_helper_lite'
require_relative '../../app/models/encyclopedia'

describe Encyclopedia do
  subject { Encyclopedia.new(name: 'Wacky') }

  it 'has a name' do
    subject.name.must_equal 'Wacky'
  end

  it 'has an empty list of articles' do
    subject.entries.must_equal []
  end

  describe "model name" do
    require 'active_model'
    require_relative '../../config/initializers/inflections'

    it "knows about model name" do
      subject.class.model_name.singular.must_equal 'encyclopedia'
      subject.class.model_name.plural.must_equal 'encyclopedias'
    end
  end
end
