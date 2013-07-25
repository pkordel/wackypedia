require_relative '../spec_helper_lite'
require_relative '../../app/adapters/storage_adapter'
require_relative '../../app/adapters/memory_storage'
require_relative '../../app/adapters/article_storage_adapter'

describe ArticleStorageAdapter do
  let(:first)  { Struct.new(:id, :title, :body).new(nil, 'First', 'World') }
  let(:second) { Struct.new(:id, :title, :body).new(nil, 'Second', 'World') }

  subject do
    ArticleStorageAdapter.instance = MemoryStorage.new
    ArticleStorageAdapter
  end

  context "when using in memory engine" do
    before do
      subject.clear
      subject.add first
    end

    it "fetchs an article" do
      subject.fetch(1).must_equal first
    end

    it "fetchs first article" do
      subject.first.must_equal first
    end

    it "fetchs last article" do
      subject.add second
      subject.last.must_equal second
    end

    it "fetchs all articles" do
      subject.fetch_all.must_equal [first]
    end

    it "fetchs subset of records" do
      subject.add second
      subject.take(1).must_equal [first]
    end

    it "removes an article" do
      subject.add second
      subject.remove 1
      subject.fetch_all.must_equal [second]
    end

    it "builds a new article object" do
      require 'active_model'
      require_relative '../../app/models/article'

      article = subject.new_article(title: 'Title', body: 'Body')
      article.title.must_equal 'Title'
      article.body.must_equal  'Body'
    end
  end

end
