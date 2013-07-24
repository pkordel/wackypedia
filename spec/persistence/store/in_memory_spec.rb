require_relative '../../spec_helper_lite'
require_relative '../../../app/persistence/store/in_memory'

describe Store::InMemory do
  let(:first)  { Struct.new(:id, :title, :body).new(nil, 'Hello', 'World') }
  let(:second) { Struct.new(:id, :title, :body).new(nil, 'Hello', 'World') }

  subject { Store::InMemory.new }

  it "adds records" do
    subject.add first
    subject.count.must_equal 1
  end

  it "finds a record" do
    subject.add first
    subject.find(1).must_equal first
  end

  it "finds first record" do
    subject.add first
    subject.first.must_equal first
  end

  it "finds last record" do
    subject.add second
    subject.add first
    subject.last.must_equal first
  end

  it "finds subset of records" do
    subject.add first
    subject.add second
    subject.take(1).must_equal [first]
  end

  it "removes a record" do
    subject.add first
    subject.add second
    subject.remove 1
    subject.all.must_equal [second]
  end

  it "finds all records" do
    subject.add first
    subject.all.must_equal [first]
  end
end
